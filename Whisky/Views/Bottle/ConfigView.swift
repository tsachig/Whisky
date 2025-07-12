//
//  ConfigView.swift
//  Whisky
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

import SwiftUI
import WhiskyKit

enum LoadingState {
    case loading
    case modifying
    case success
    case failed
}

struct ConfigView: View {
    @ObservedObject var bottle: Bottle
    @State private var buildVersion: Int = 0
    @State private var retinaMode: Bool = false
    @State private var dpiConfig: Int = 96
    @State private var winVersionLoadingState: LoadingState = .loading
    @State private var buildVersionLoadingState: LoadingState = .loading
    @State private var retinaModeLoadingState: LoadingState = .loading
    @State private var dpiConfigLoadingState: LoadingState = .loading
    @State private var dpiSheetPresented: Bool = false
    @AppStorage("wineSectionExpanded") private var wineSectionExpanded: Bool = true
    @AppStorage("dxvkSectionExpanded") private var dxvkSectionExpanded: Bool = true
    @AppStorage("metalSectionExpanded") private var metalSectionExpanded: Bool = true

    var body: some View {
        Form {
            Section("config.title.wine", isExpanded: $wineSectionExpanded) {
                SettingItemView(title: "config.winVersion", loadingState: winVersionLoadingState) {
                    Picker("config.winVersion", selection: $bottle.settings.windowsVersion) {
                        ForEach(WinVersion.allCases.reversed(), id: \.self) {
                            Text($0.pretty())
                        }
                    }
                }
                SettingItemView(title: "config.buildVersion", loadingState: buildVersionLoadingState) {
                    TextField("config.buildVersion", value: $buildVersion, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(PlainTextFieldStyle())
                        .onSubmit {
                            buildVersionLoadingState = .modifying
                            Task(priority: .userInitiated) {
                                do {
                                    try await Wine.changeBuildVersion(bottle: bottle, version: buildVersion)
                                    buildVersionLoadingState = .success
                                } catch {
                                    print("Failed to change build version")
                                    buildVersionLoadingState = .failed
                                }
                            }
                        }
                }
                SettingItemView(title: "config.retinaMode", loadingState: retinaModeLoadingState) {
                    Toggle("config.retinaMode", isOn: $retinaMode)
                        .onChange(of: retinaMode, { _, newValue in
                            Task(priority: .userInitiated) {
                                retinaModeLoadingState = .modifying
                                do {
                                    try await Wine.changeRetinaMode(bottle: bottle, retinaMode: newValue)
                                    retinaModeLoadingState = .success
                                } catch {
                                    print("Failed to change build version")
                                    retinaModeLoadingState = .failed
                                }
                            }
                        })
                }
                VStack(alignment: .leading) {
                    Picker("config.enhancedSync", selection: $bottle.settings.enhancedSync) {
                        Text("config.enhancedSync.none").tag(EnhancedSync.none)
                        Text("config.enhacnedSync.esync").tag(EnhancedSync.esync)
                        Text("config.enhacnedSync.msync").tag(EnhancedSync.msync)
                    }
                    Text("config.enhancedSync.description")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                SettingItemView(title: "config.dpi", loadingState: dpiConfigLoadingState) {
                    Button("config.inspect") {
                        dpiSheetPresented = true
                    }
                    .sheet(isPresented: $dpiSheetPresented) {
                        DPIConfigSheetView(
                            dpiConfig: $dpiConfig,
                            isRetinaMode: $retinaMode,
                            presented: $dpiSheetPresented
                        )
                    }
                }
                if #available(macOS 15, *) {
                    Toggle(isOn: $bottle.settings.avxEnabled) {
                        VStack(alignment: .leading) {
                            Text("config.avx")
                            Text("config.avx.description")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            if bottle.settings.avxEnabled {
                                HStack(alignment: .firstTextBaseline) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .symbolRenderingMode(.multicolor)
                                        .font(.subheadline)
                                    Text("config.avx.warning")
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            
            // DirectX Auto-Configuration Section
            Section("DirectX Detection & Auto-Configuration") {
                // Prioritize pinned programs (games users actually want to run)
                let pinnedExecutables = bottle.programs.filter { program in
                    program.pinned && program.url.lastPathComponent.hasSuffix(".exe")
                }
                
                // Filter out system executables and utilities
                let systemExecutables = ["iexplore.exe", "winecfg.exe", "notepad.exe", "regedit.exe", "cmd.exe", "wineboot.exe"]
                let gameExecutables = bottle.programs.filter { program in
                    let fileName = program.url.lastPathComponent.lowercased()
                    return fileName.hasSuffix(".exe") && 
                           !systemExecutables.contains(fileName) &&
                           !fileName.contains("setup") && 
                           !fileName.contains("install") && 
                           !fileName.contains("unins") &&
                           !fileName.contains("launcher") &&
                           !fileName.contains("updater")
                }
                
                // Priority: 1) Pinned executables, 2) Game executables, 3) Any executable
                if let selectedProgram = pinnedExecutables.first ?? gameExecutables.first ?? bottle.programs.first(where: { $0.url.lastPathComponent.hasSuffix(".exe") }) {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Analyzing: \(selectedProgram.url.lastPathComponent)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Spacer()
                                if pinnedExecutables.contains(selectedProgram) {
                                    Text("📌 Pinned")
                                        .font(.caption2)
                                        .foregroundColor(.blue)
                                } else if gameExecutables.contains(selectedProgram) {
                                    Text("🎮 Game")
                                        .font(.caption2)
                                        .foregroundColor(.green)
                                } else {
                                    Text("📁 Other")
                                        .font(.caption2)
                                        .foregroundColor(.orange)
                                }
                            }
                            HStack {
                                Text("Detected DirectX Version:")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                Spacer()
                                Text(selectedProgram.directXVersion.rawValue)
                                    .font(.subheadline)
                                    .foregroundColor(selectedProgram.directXVersion == .unknown ? .secondary : .primary)
                            }
                        }
                        
                        if selectedProgram.hasSuboptimalDXVKSettings {
                            HStack {
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundColor(.orange)
                                VStack(alignment: .leading) {
                                    Text("Suboptimal DXVK Configuration")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                    Text("Current settings may not be optimal for \(selectedProgram.directXVersion.rawValue)")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button("Auto-Configure") {
                                    selectedProgram.applyRecommendedDXVKSettings()
                                }
                                .buttonStyle(.borderedProminent)
                                .controlSize(.small)
                            }
                            .padding(.vertical, 4)
                        } else {
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                                Text("DXVK settings are optimized for detected DirectX version")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        if selectedProgram.directXVersion != .unknown {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Recommended Settings:")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                let recommended = selectedProgram.recommendedDXVKSettings
                                Text("• DXVK: \(recommended.dxvkEnabled ? "Enabled" : "Disabled")")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                if recommended.dxrEnabled {
                                    Text("• DirectX Raytracing: Enabled")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                } else {
                    Text("No .exe files found in this bottle for DirectX detection")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("config.title.dxvk", isExpanded: $dxvkSectionExpanded) {
                Toggle(isOn: $bottle.settings.dxvk) {
                    VStack(alignment: .leading) {
                        Text("config.dxvk")
                        Text("config.dxvk.description")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .onChange(of: bottle.settings.dxvk) { _, newValue in
                    if !newValue {
                        // Clean up DXVK marker when disabled
                        try? Wine.disableDXVK(bottle: bottle)
                    }
                }
                Toggle(isOn: $bottle.settings.dxvkAsync) {
                    VStack(alignment: .leading) {
                        Text("config.dxvk.async")
                        Text("config.dxvk.async.description")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(!bottle.settings.dxvk)
                VStack(alignment: .leading) {
                    Picker("config.dxvkHud", selection: $bottle.settings.dxvkHud) {
                        Text("config.dxvkHud.full").tag(DXVKHUD.full)
                        Text("config.dxvkHud.partial").tag(DXVKHUD.partial)
                        Text("config.dxvkHud.fps").tag(DXVKHUD.fps)
                        Text("config.dxvkHud.off").tag(DXVKHUD.off)
                    }
                    .disabled(!bottle.settings.dxvk)
                    Text("config.dxvkHud.description")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Section("config.title.metal", isExpanded: $metalSectionExpanded) {
                Toggle(isOn: $bottle.settings.metalHud) {
                    Text("config.metalHud")
                    Text("config.metalHud.info")
                }
                Toggle(isOn: $bottle.settings.metalTrace) {
                    Text("config.metalTrace")
                    Text("config.metalTrace.info")
                }
                if let device = MTLCreateSystemDefaultDevice() {
                    // Represents the Apple family 9 GPU features that correspond to the Apple A17, M3, and M4 GPUs.
                    if device.supportsFamily(.apple9) {
                        Toggle(isOn: $bottle.settings.dxrEnabled) {
                            Text("config.dxr")
                            Text("config.dxr.info")
                        }
                    }
                }
            }
        }
        .formStyle(.grouped)
        .animation(.whiskyDefault, value: wineSectionExpanded)
        .animation(.whiskyDefault, value: dxvkSectionExpanded)
        .animation(.whiskyDefault, value: metalSectionExpanded)
        .bottomBar {
            HStack {
                Spacer()
                Button("config.controlPanel") {
                    Task(priority: .userInitiated) {
                        do {
                            try await Wine.control(bottle: bottle)
                        } catch {
                            print("Failed to launch control")
                        }
                    }
                }
                Button("config.regedit") {
                    Task(priority: .userInitiated) {
                        do {
                            try await Wine.regedit(bottle: bottle)
                        } catch {
                            print("Failed to launch regedit")
                        }
                    }
                }
                Button("config.winecfg") {
                    Task(priority: .userInitiated) {
                        do {
                            try await Wine.cfg(bottle: bottle)
                        } catch {
                            print("Failed to launch winecfg")
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("tab.config")
        .onAppear {
            winVersionLoadingState = .success

            loadBuildName()

            Task(priority: .userInitiated) {
                do {
                    retinaMode = try await Wine.retinaMode(bottle: bottle)
                    retinaModeLoadingState = .success
                } catch {
                    print(error)
                    retinaModeLoadingState = .failed
                }
            }
            Task(priority: .userInitiated) {
                do {
                    dpiConfig = try await Wine.dpiResolution(bottle: bottle) ?? 0
                    dpiConfigLoadingState = .success
                } catch {
                    print(error)
                    // If DPI has not yet been edited, there will be no registry entry
                    dpiConfigLoadingState = .success
                }
            }
        }
        .onChange(of: bottle.settings.windowsVersion) { _, newValue in
            if winVersionLoadingState == .success {
                winVersionLoadingState = .loading
                buildVersionLoadingState = .loading
                Task(priority: .userInitiated) {
                    do {
                        try await Wine.changeWinVersion(bottle: bottle, win: newValue)
                        winVersionLoadingState = .success
                        bottle.settings.windowsVersion = newValue
                        loadBuildName()
                    } catch {
                        print(error)
                        winVersionLoadingState = .failed
                    }
                }
            }
        }
        .onChange(of: dpiConfig) {
            if dpiConfigLoadingState == .success {
                Task(priority: .userInitiated) {
                    dpiConfigLoadingState = .modifying
                    do {
                        try await Wine.changeDpiResolution(bottle: bottle, dpi: dpiConfig)
                        dpiConfigLoadingState = .success
                    } catch {
                        print(error)
                        dpiConfigLoadingState = .failed
                    }
                }
            }
        }
    }

    func loadBuildName() {
        Task(priority: .userInitiated) {
            do {
                if let buildVersionString = try await Wine.buildVersion(bottle: bottle) {
                    buildVersion = Int(buildVersionString) ?? 0
                } else {
                    buildVersion = 0
                }

                buildVersionLoadingState = .success
            } catch {
                print(error)
                buildVersionLoadingState = .failed
            }
        }
    }
}

struct DPIConfigSheetView: View {
    @Binding var dpiConfig: Int
    @Binding var isRetinaMode: Bool
    @Binding var presented: Bool
    @State var stagedChanges: Float
    @FocusState var textFocused: Bool

    init(dpiConfig: Binding<Int>, isRetinaMode: Binding<Bool>, presented: Binding<Bool>) {
        self._dpiConfig = dpiConfig
        self._isRetinaMode = isRetinaMode
        self._presented = presented
        self.stagedChanges = Float(dpiConfig.wrappedValue)
    }

    var body: some View {
        VStack {
            HStack {
                Text("configDpi.title")
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
            GroupBox(label: Label("configDpi.preview", systemImage: "text.magnifyingglass")) {
                VStack {
                    HStack {
                        Text("configDpi.previewText")
                            .padding(16)
                            .font(.system(size:
                                (10 * CGFloat(stagedChanges)) / 72 *
                                          (isRetinaMode ? 0.5 : 1)
                            ))
                        Spacer()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 80)
            }
            HStack {
                Slider(value: $stagedChanges, in: 96...480, step: 24, onEditingChanged: { _ in
                    textFocused = false
                })
                TextField(String(), value: $stagedChanges, format: .number)
                    .frame(width: 40)
                    .focused($textFocused)
                Text("configDpi.dpi")
            }
            Spacer()
            HStack {
                Spacer()
                Button("create.cancel") {
                    presented = false
                }
                .keyboardShortcut(.cancelAction)
                Button("button.ok") {
                    dpiConfig = Int(stagedChanges)
                    presented = false
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
        .frame(width: ViewWidth.medium, height: 240)
    }
}

struct SettingItemView<Content: View>: View {
    let title: String.LocalizationValue
    let loadingState: LoadingState
    @ViewBuilder var content: () -> Content

    @Namespace private var viewId
    @Namespace private var progressViewId

    var body: some View {
        HStack {
            Text(String(localized: title))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                switch loadingState {
                case .loading, .modifying:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(.small)
                        .matchedGeometryEffect(id: progressViewId, in: viewId)
                case .success:
                    content()
                        .labelsHidden()
                        .disabled(loadingState != .success)
                case .failed:
                    Text("config.notAvailable")
                        .font(.caption).foregroundStyle(.red)
                        .multilineTextAlignment(.trailing)
                }
            }.animation(.default, value: loadingState)
        }
    }
}
