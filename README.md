<div align="center">

  # Whisky 🥃 
  *Wine but a bit stronger*
  
  ![](https://img.shields.io/github/actions/workflow/status/IsaacMarovitz/Whisky/SwiftLint.yml?style=for-the-badge)
  [![](https://img.shields.io/discord/1115955071549702235?style=for-the-badge)](https://discord.gg/CsqAfs9CnM)
</div>

## 🎮 Project Revival: Gaming-Focused Whisky is Back!

**Whisky development has been restored!** After being deprecated, Whisky is now actively maintained with a **gaming-focused approach** for Apple Silicon Macs. This major update optimizes gaming performance and transforms it into a dedicated Windows gaming emulator.

### 🚀 **What's New**
- **🎮 Gaming-Focused**: Repositioned as a Windows gaming emulator
- **📚 Complete Documentation**: Comprehensive gaming guides and setup instructions  
- **🛠️ Modernized Codebase**: Swift 6 compatibility and build system updates
- **🌟 Community Ready**: Gaming issue templates and compatibility reporting
- **⚡ Gaming Optimized**: Enhanced DXVK, msync tuning, and Metal performance improvements

👉 **[See Gaming Improvements Guide](GAMING-IMPROVEMENTS.md)** 👈

### 🎮 **Gaming-Focused Windows Emulator**

**Whisky** provides a native macOS interface for running Windows games on Apple Silicon Macs with optimized gaming performance through Wine, DXVK-macOS, D3DMetal, and Apple's Game Porting Toolkit.

---

**Whisky** is a gaming-focused Windows emulator for Apple Silicon Macs. Built with native SwiftUI, it provides a clean interface for running Windows games with no technical knowledge required. Whisky leverages Wine 7.7 with gaming optimizations, DXVK-macOS, D3DMetal, and Apple's Game Porting Toolkit for optimal gaming performance on Apple Silicon.

### 🍷 Wine Version Information
- **Current Wine Version**: Wine 7.7 (stable, gaming-optimized)
- **Distribution**: Custom WhiskyWine build with Apple Silicon optimizations
- **Gaming Focus**: Optimized for DirectX 10/11 gaming with DXVK integration

### 🎯 Gaming Features
- **High-Performance Gaming**: Optimized Wine configuration with gaming enhancements
- **DirectX Auto-Detection**: Smart detection of DirectX 9/10/11/12 with automatic DXVK optimization
- **DirectX 10/11 Support**: DXVK enabled by default for better compatibility and reduced stuttering
- **Apple Silicon Optimized**: Native performance with Game Porting Toolkit
- **Advanced Gaming Graphics**: DXVK-macOS, D3DMetal, MoltenVK integration
- **Gaming Performance Tools**: Metal HUD, DXVK HUD, performance monitoring

Translated on [Crowdin](https://crowdin.com/project/whisky).

---

## System Requirements
- CPU: Apple Silicon (M-series chips)
- OS: macOS Sonoma 14.0 or later

## Homebrew

Whisky is on homebrew! Install with 
`brew install --cask whisky`.

## 🎮 Gaming Support & Compatibility

### Gaming Performance Improvements
- **Enhanced DirectX 10/11**: DXVK enabled by default for better compatibility and reduced stuttering
- **Apple Silicon Optimization**: msync tuning and memory enhancements for native performance  
- **Metal Performance**: Enhanced Metal HUD with logging for real-time monitoring
- **Startup Optimization**: Cached DXVK setup for faster game launches

### Gaming Configuration
- **DirectX Auto-Detection**: Automatically detects DirectX 9/10/11/12 from game executables and suggests optimal settings
- **Smart DXVK Configuration**: Auto-configures DXVK based on detected DirectX version for maximum compatibility
- **DXVK (Enabled by Default)**: Improves DirectX 10/11 compatibility and reduces stuttering
- **DXVK Async**: Smoother shader compilation for gaming
- **Metal HUD**: Real-time gaming performance monitoring with frame rate, GPU usage, and memory metrics
- **Enhanced Sync**: Apple Silicon-optimized msync for gaming
- **Process Elevation**: "Run as Administrator" for games requiring it

**💡 Gaming Tip**: Whisky automatically detects your game's DirectX version and suggests optimal DXVK settings. DXVK is recommended for DirectX 10/11 games but not needed for DirectX 12 games. The auto-configuration feature takes the guesswork out of optimization.

### Game Compatibility
Some games need special configuration. Check out:
- **[Gaming Wiki](https://github.com/IsaacMarovitz/Whisky/wiki/Game-Support)** - Game-specific setup guides
- **[Gaming Performance Improvements](GAMING-IMPROVEMENTS.md)** - Gaming optimizations and setup guide
- **Gaming Performance**: Use Metal HUD and DXVK HUD for optimization

---

## 🚀 Wine 10.0 Roadmap

**Coming Soon**: Whisky is preparing for a major Wine 10.0 update that will bring significant gaming improvements to Apple Silicon Macs.

### 🎯 **Wine 10.0 Gaming Improvements (In Development)**
- **🏗️ ARM64EC Support**: Native Windows ARM64 application support
- **🎨 Enhanced DirectX 12**: Improved raytracing and graphics performance  
- **🖥️ Better High-DPI**: Improved scaling for modern gaming displays
- **⚡ Process Elevation**: Full "Run as Administrator" support for demanding games
- **🔧 Windows 11 Compatibility**: Enhanced support for newer Windows applications

### 📋 **Development Status**
- ✅ **Code Preparation**: Wine 10.0 integration code completed
- ✅ **Gaming Optimizations**: DXVK and performance tuning ready
- 🔄 **Binary Distribution**: Custom Wine 10.0 build in progress
- ⏳ **Testing Phase**: Compatibility validation planned
- ⏳ **Community Release**: Beta testing with gaming community

### 🤝 **Community Involvement**
Interested in Wine 10.0 testing? Join our [Discord community](https://discord.gg/CsqAfs9CnM) for updates and early access opportunities.

---

## Credits & Acknowledgments

Whisky is possible thanks to the magic of several projects:

- [msync](https://github.com/marzent/wine-msync) by marzent
- [DXVK-macOS](https://github.com/Gcenx/DXVK-macOS) by Gcenx and doitsujin
- [MoltenVK](https://github.com/KhronosGroup/MoltenVK) by KhronosGroup
- [Sparkle](https://github.com/sparkle-project/Sparkle) by sparkle-project
- [SemanticVersion](https://github.com/SwiftPackageIndex/SemanticVersion) by SwiftPackageIndex
- [swift-argument-parser](https://github.com/apple/swift-argument-parser) by Apple
- [SwiftTextTable](https://github.com/scottrhoyt/SwiftyTextTable) by scottrhoyt
- [Wine](https://www.winehq.org) by WineHQ
- D3DMetal by Apple

Special thanks to Gcenx, ohaiibuzzle, and Nat Brown for their support and contributions!

---

<table>
  <tr>
    <td>
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="./images/cw-dark.png">
          <img src="./images/cw-light.png" width="500">
        </picture>
    </td>
    <td>
        Whisky doesn't exist without CrossOver. Support the work of CodeWeavers using our <a href="https://www.codeweavers.com/store?ad=1010">affiliate link</a>.
    </td>
  </tr>
</table>
