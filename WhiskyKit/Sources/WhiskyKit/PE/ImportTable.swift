//
//  ImportTable.swift
//  WhiskyKit
//
//  This file is part of Whisky.
//
//  Whisky is free software: you can redistribute it and/or modify it under the terms
//  of the GNU General Public License as published by the Free Software Foundation,
//  either version 3 of the License, or (at your option) any later version.
//
//  Whisky is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//  See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with Whisky.
//  If not, see https://www.gnu.org/licenses/.
//

import Foundation

/// Import Directory Table Entry
/// 
/// https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#import-directory-table
public struct ImportDirectoryEntry: Hashable, Equatable, Sendable {
    public let importLookupTableRVA: UInt32
    public let timeDateStamp: UInt32
    public let forwarderChain: UInt32
    public let nameRVA: UInt32
    public let importAddressTableRVA: UInt32
    public let dllName: String
    
    init?(handle: FileHandle, offset: UInt64, sections: [PEFile.Section]) {
        var offset = offset
        
        self.importLookupTableRVA = handle.extract(UInt32.self, offset: offset) ?? 0
        offset += 4
        self.timeDateStamp = handle.extract(UInt32.self, offset: offset) ?? 0
        offset += 4
        self.forwarderChain = handle.extract(UInt32.self, offset: offset) ?? 0
        offset += 4
        self.nameRVA = handle.extract(UInt32.self, offset: offset) ?? 0
        offset += 4
        self.importAddressTableRVA = handle.extract(UInt32.self, offset: offset) ?? 0
        
        // If all fields are zero, this is the end of the import table
        guard importLookupTableRVA != 0 || timeDateStamp != 0 || forwarderChain != 0 || 
              nameRVA != 0 || importAddressTableRVA != 0 else {
            return nil
        }
        
        // Resolve the DLL name
        guard let nameFileOffset = resolveRVA(rva: nameRVA, sections: sections) else {
            print("❌ Failed to resolve RVA \(nameRVA) for DLL name")
            return nil
        }
        
        do {
            try handle.seek(toOffset: UInt64(nameFileOffset))
            let nameData = try handle.readNullTerminatedString()
            self.dllName = nameData.lowercased()
            print("📦 Found imported DLL: \(self.dllName)")
        } catch {
            print("❌ Failed to read DLL name at offset \(nameFileOffset): \(error)")
            return nil
        }
    }
}

/// Import Table containing all imported DLLs
public struct ImportTable: Hashable, Equatable, Sendable {
    public let entries: [ImportDirectoryEntry]
    public let importedDLLs: [String]
    
    /// Initialize Import Table from PE file
    /// - Parameters:
    ///   - handle: File handle to read from
    ///   - importDirectoryRVA: RVA to import directory
    ///   - sections: Section table for RVA resolution
    init?(handle: FileHandle, importDirectoryRVA: UInt32, sections: [PEFile.Section]) {
        guard importDirectoryRVA != 0 else { 
            print("❌ Import directory RVA is 0")
            return nil 
        }
        
        print("🔍 Parsing import table at RVA: 0x\(String(importDirectoryRVA, radix: 16))")
        
        guard let importDirectoryOffset = resolveRVA(rva: importDirectoryRVA, sections: sections) else {
            print("❌ Failed to resolve import directory RVA \(importDirectoryRVA)")
            return nil
        }
        
        print("📍 Import directory file offset: 0x\(String(importDirectoryOffset, radix: 16))")
        
        var entries: [ImportDirectoryEntry] = []
        var offset = UInt64(importDirectoryOffset)
        
        // Parse import directory entries until we hit the null terminator
        while let entry = ImportDirectoryEntry(handle: handle, offset: offset, sections: sections) {
            entries.append(entry)
            offset += 20 // Size of ImportDirectoryEntry structure
        }
        
        self.entries = entries
        self.importedDLLs = entries.map { $0.dllName }
        
        print("✅ Parsed \(entries.count) import entries: \(importedDLLs)")
    }
}

/// DirectX Version detected from imported DLLs
public enum DirectXVersion: String, CaseIterable, Sendable {
    case dx9 = "DirectX 9"
    case dx10 = "DirectX 10"
    case dx11 = "DirectX 11" 
    case dx12 = "DirectX 12"
    case unknown = "Unknown"
    
    /// Detect DirectX version from imported DLL names
    /// - Parameter dllNames: List of imported DLL names (lowercase)
    /// - Returns: Detected DirectX version
    public static func detect(from dllNames: [String]) -> DirectXVersion {
        let dlls = Set(dllNames)
        
        // Debug logging
        print("🔍 DirectX Detection - Analyzing \(dlls.count) DLLs: \(dlls.sorted())")
        
        // DirectX 12 detection (highest priority)
        if dlls.contains("d3d12.dll") {
            print("✅ DirectX 12 detected (d3d12.dll)")
            return .dx12
        }
        
        // DirectX 11 detection - expanded patterns
        let dx11Patterns = ["d3d11.dll", "dxgi.dll", "d3d11_1.dll", "d3d11_2.dll", "d3d11_3.dll"]
        if dlls.intersection(dx11Patterns).count > 0 {
            print("✅ DirectX 11 detected (\(dlls.intersection(dx11Patterns)))")
            return .dx11
        }
        
        // DirectX 10 detection - expanded patterns
        let dx10Patterns = ["d3d10.dll", "d3d10core.dll", "d3d10_1.dll", "d3d10_1core.dll", "d3d10effect.dll"]
        if dlls.intersection(dx10Patterns).count > 0 {
            print("✅ DirectX 10 detected (\(dlls.intersection(dx10Patterns)))")
            return .dx10
        }
        
        // DirectX 9 detection - expanded patterns
        let dx9Patterns = ["d3d9.dll", "d3dx9_43.dll", "d3dx9_42.dll", "d3dx9_41.dll", "d3dx9_40.dll"]
        if dlls.intersection(dx9Patterns).count > 0 {
            print("✅ DirectX 9 detected (\(dlls.intersection(dx9Patterns)))")
            return .dx9
        }
        
        print("❌ No DirectX DLLs detected from known patterns")
        return .unknown
    }
    
    /// Get recommended DXVK setting for this DirectX version
    public var recommendedDXVKEnabled: Bool {
        switch self {
        case .dx10, .dx11:
            return true  // DXVK helps with DX10/11
        case .dx9, .dx12, .unknown:
            return false // DXVK not needed/helpful for DX9/12
        }
    }
    
    /// Get recommended DXR (raytracing) setting for this DirectX version
    public var recommendedDXREnabled: Bool {
        switch self {
        case .dx12:
            return true  // DX12 can use raytracing
        default:
            return false
        }
    }
}

/// Helper function to resolve RVA to file offset
/// - Parameters:
///   - rva: Relative Virtual Address
///   - sections: Section table
/// - Returns: File offset or nil if RVA cannot be resolved
private func resolveRVA(rva: UInt32, sections: [PEFile.Section]) -> UInt32? {
    for section in sections {
        let sectionStart = section.virtualAddress
        let sectionEnd = section.virtualAddress + section.virtualSize
        
        if rva >= sectionStart && rva < sectionEnd {
            let offset = rva - sectionStart
            return section.pointerToRawData + offset
        }
    }
    return nil
}

// Extension to FileHandle for reading null-terminated strings
extension FileHandle {
    func readNullTerminatedString() throws -> String {
        var data = Data()
        var byte: UInt8 = 0
        
        repeat {
            let readData = try read(upToCount: 1)
            guard let readData = readData, !readData.isEmpty else {
                break
            }
            byte = readData[0]
            if byte != 0 {
                data.append(byte)
            }
        } while byte != 0
        
        return String(data: data, encoding: .ascii) ?? ""
    }
}