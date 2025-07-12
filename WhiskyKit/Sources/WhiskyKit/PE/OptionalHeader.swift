//
//  PortableExecutable+OptionalHeader.swift
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

extension PEFile {
    /// Optional Header
    /// 
    /// https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#optional-header-image-only
    public struct OptionalHeader: Hashable, Equatable, Sendable {
        // Standard Fields

        public let magic: Magic
        public let majorLinkerVersion: UInt8
        public let minorLinkerVersion: UInt8
        public let sizeOfCode: UInt32
        public let sizeOfInitializedData: UInt32
        public let sizeOfUninitializedData: UInt32
        public let addressOfEntryPoint: UInt32
        public let baseOfCode: UInt32
        public let baseOfData: UInt32?

        // Windows-Specific Fields

        public let imageBase: UInt64
        public let sectionAlignment: UInt32
        public let fileAlignment: UInt32
        public let majorOperatingSystemVersion: UInt16
        public let minorOperatingSystemVersion: UInt16
        public let majorImageVersion: UInt16
        public let minorImageVersion: UInt16
        public let majorSubsystemVersion: UInt16
        public let minorSubsystemVersion: UInt16
        public let win32VersionValue: UInt32
        public let sizeOfImage: UInt32
        public let sizeOfHeaders: UInt32
        public let checkSum: UInt32
        public let subsystem: UInt16
        public let dllCharacteristics: UInt16
        public let sizeOfStackReserve: UInt64
        public let sizeOfStackCommit: UInt64
        public let sizeOfHeapReserve: UInt64
        public let sizeOfHeapCommit: UInt64
        public let loaderFlags: UInt32
        public let numberOfRvaAndSizes: UInt32
        
        // Data Directories
        public let dataDirectories: [DataDirectory]

        // swiftlint:disable:next function_body_length
        init?(handle: FileHandle, offset: UInt64) {
            var offset = offset
            let rawMagic = handle.extract(UInt16.self, offset: offset) ?? 0
            let magic = Magic(rawValue: rawMagic) ?? .unknown
            self.magic = magic
            print("🔍 PE Magic: \(magic) (0x\(String(rawMagic, radix: 16)))")
            offset += 2
            self.majorLinkerVersion = handle.extract(UInt8.self, offset: offset) ?? 0
            offset += 1
            self.minorLinkerVersion = handle.extract(UInt8.self, offset: offset) ?? 0
            offset += 1
            self.sizeOfCode = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.sizeOfInitializedData = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.sizeOfUninitializedData = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.addressOfEntryPoint = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.baseOfCode = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4

            switch magic {
            case .pe32Plus:
                // PE32+ does not contain this field, following BaseOfCode is a larger ImageBase instead.
                self.baseOfData = nil

                // PE32+ images have a 8 byte ImageBase field
                self.imageBase = handle.extract(UInt64.self, offset: offset) ?? 0
                offset += 8
            default:
                // PE32 contains this additional field, following BaseOfCode.
                self.baseOfData = handle.extract(UInt32.self, offset: offset) ?? 0
                offset += 4

                // PE32 images have a 4 byte ImageBase field
                let imageBase = handle.extract(UInt32.self, offset: offset) ?? 0
                self.imageBase = UInt64(imageBase)
                offset += 4
            }

            self.sectionAlignment = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.fileAlignment = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.majorOperatingSystemVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.minorOperatingSystemVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.majorImageVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.minorImageVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.majorSubsystemVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.minorSubsystemVersion = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.win32VersionValue = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.sizeOfImage = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.sizeOfHeaders = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.checkSum = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.subsystem = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            self.dllCharacteristics = handle.extract(UInt16.self, offset: offset) ?? 0
            offset += 2
            
            // Stack and heap sizes depend on PE format
            switch magic {
            case .pe32Plus:
                // PE32+ uses 64-bit fields
                self.sizeOfStackReserve = handle.extract(UInt64.self, offset: offset) ?? 0
                offset += 8
                self.sizeOfStackCommit = handle.extract(UInt64.self, offset: offset) ?? 0
                offset += 8
                self.sizeOfHeapReserve = handle.extract(UInt64.self, offset: offset) ?? 0
                offset += 8
                self.sizeOfHeapCommit = handle.extract(UInt64.self, offset: offset) ?? 0
                offset += 8
            default:
                // PE32 uses 32-bit fields
                self.sizeOfStackReserve = UInt64(handle.extract(UInt32.self, offset: offset) ?? 0)
                offset += 4
                self.sizeOfStackCommit = UInt64(handle.extract(UInt32.self, offset: offset) ?? 0)
                offset += 4
                self.sizeOfHeapReserve = UInt64(handle.extract(UInt32.self, offset: offset) ?? 0)
                offset += 4
                self.sizeOfHeapCommit = UInt64(handle.extract(UInt32.self, offset: offset) ?? 0)
                offset += 4
            }
            self.loaderFlags = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            self.numberOfRvaAndSizes = handle.extract(UInt32.self, offset: offset) ?? 0
            offset += 4
            
            // Parse Data Directories
            print("🔍 numberOfRvaAndSizes: \(numberOfRvaAndSizes)")
            var dataDirectories: [DataDirectory] = []
            for i in 0..<numberOfRvaAndSizes {
                print("📂 Parsing data directory \(i) at offset 0x\(String(offset, radix: 16))")
                if let directory = DataDirectory(handle: handle, offset: offset) {
                    print("✅ Data directory \(i): RVA=0x\(String(directory.virtualAddress, radix: 16)), Size=\(directory.size)")
                    dataDirectories.append(directory)
                } else {
                    print("❌ Failed to parse data directory \(i)")
                }
                offset += 8 // Size of DataDirectory (RVA + Size)
            }
            self.dataDirectories = dataDirectories
            print("📊 Total data directories parsed: \(dataDirectories.count)")
        }
        
        /// Get the import directory from data directories
        public var importDirectory: DataDirectory? {
            print("🔍 Data directories count: \(dataDirectories.count)")
            for (index, dir) in dataDirectories.enumerated() {
                print("📂 Data directory \(index): RVA=0x\(String(dir.virtualAddress, radix: 16)), Size=\(dir.size)")
            }
            
            guard dataDirectories.indices.contains(1) else {
                print("❌ Import directory (index 1) not found in data directories")
                return nil
            }
            
            let importDir = dataDirectories[1]
            print("📥 Import directory: RVA=0x\(String(importDir.virtualAddress, radix: 16)), Size=\(importDir.size)")
            return importDir
        }
    }
    
    /// Data Directory Entry
    /// 
    /// https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#optional-header-data-directories-image-only
    public struct DataDirectory: Hashable, Equatable, Sendable {
        public let virtualAddress: UInt32
        public let size: UInt32
        
        init?(handle: FileHandle, offset: UInt64) {
            var offset = offset
            guard let va = handle.extract(UInt32.self, offset: offset) else {
                print("❌ Failed to read virtualAddress at offset 0x\(String(offset, radix: 16))")
                return nil
            }
            self.virtualAddress = va
            offset += 4
            
            guard let sz = handle.extract(UInt32.self, offset: offset) else {
                print("❌ Failed to read size at offset 0x\(String(offset, radix: 16))")
                return nil
            }
            self.size = sz
            
            print("📋 DataDirectory: VA=0x\(String(virtualAddress, radix: 16)), Size=\(size)")
        }
    }
}
