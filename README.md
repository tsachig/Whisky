<div align="center">

  # Whisky 🥃 
  *Wine but a bit stronger*
  
  ![](https://img.shields.io/github/actions/workflow/status/IsaacMarovitz/Whisky/SwiftLint.yml?style=for-the-badge)
  [![](https://img.shields.io/discord/1115955071549702235?style=for-the-badge)](https://discord.gg/CsqAfs9CnM)
</div>

## 🎮 Project Revival: Gaming-Focused Whisky is Back!

**Whisky development has been restored!** After being deprecated, Whisky is now actively maintained with a **gaming-focused approach** for Apple Silicon Macs. This major update prepares Whisky for Wine 10.0 and transforms it into a dedicated Windows gaming emulator.

### 🚀 **What's New**
- **🎮 Gaming-Focused**: Repositioned as a Windows gaming emulator
- **📚 Complete Documentation**: Comprehensive gaming guides and setup instructions  
- **🛠️ Modernized Codebase**: Swift 6 compatibility and build system updates
- **🌟 Community Ready**: Gaming issue templates and compatibility reporting
- **⚡ Wine 10.0 Ready**: Prepared for Wine 10.0 gaming improvements

👉 **[See Gaming Improvements Guide](GAMING-IMPROVEMENTS.md)** 👈

### 🎮 **Gaming-Focused Windows Emulator**

**Whisky** provides a native macOS interface for running Windows games on Apple Silicon Macs with optimized gaming performance through Wine, DXVK-macOS, D3DMetal, and Apple's Game Porting Toolkit.

---

**Whisky** is a gaming-focused Windows emulator for Apple Silicon Macs. Built with native SwiftUI, it provides a clean interface for running Windows games with no technical knowledge required. Whisky leverages Wine 10.0, DXVK-macOS, D3DMetal, and Apple's Game Porting Toolkit for optimal gaming performance on Apple Silicon.

### 🎯 Gaming Features
- **High-Performance Gaming**: Wine 10.0 with ARM64EC support
- **DirectX 12 & Raytracing**: Enhanced gaming graphics support
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

### Wine 10.0 Gaming Improvements
- **Better DirectX 12**: Enhanced support for modern games
- **Raytracing Support**: DirectX 12 raytracing for compatible games
- **Apple Silicon Gaming**: ARM64EC support for native performance
- **High-DPI Gaming**: Automatic scaling for Retina displays

### Gaming Configuration
- **DXVK Async**: Smoother shader compilation for gaming
- **Metal HUD**: Real-time gaming performance monitoring
- **Enhanced Sync**: Apple Silicon-optimized msync for gaming
- **Process Elevation**: "Run as Administrator" for games requiring it

### Game Compatibility
Some games need special configuration. Check out:
- **[Gaming Wiki](https://github.com/IsaacMarovitz/Whisky/wiki/Game-Support)** - Game-specific setup guides
- **[Wine 10.0 Gaming Improvements](GAMING-IMPROVEMENTS.md)** - New gaming features and setup
- **Gaming Performance**: Use Metal HUD and DXVK HUD for optimization

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
- [Wine 10.0](https://www.winehq.org) by WineHQ
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
