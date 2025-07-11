<div align="center">

  # Whisky 🥃 
  *Wine but a bit stronger*
  
  ![](https://img.shields.io/github/actions/workflow/status/IsaacMarovitz/Whisky/SwiftLint.yml?style=for-the-badge)
  [![](https://img.shields.io/discord/1115955071549702235?style=for-the-badge)](https://discord.gg/CsqAfs9CnM)
</div>

## 🎮 Major Gaming Update - Wine 10.0

**Whisky has been updated to Wine 10.0** with massive gaming improvements! This gaming-focused release brings ARM64EC support, enhanced DirectX 12, raytracing capabilities, and Apple Silicon gaming optimizations.

👉 **[See What's New for Gaming](GAMING-IMPROVEMENTS.md)** 👈

<img width="650" alt="Config" src="https://github.com/Whisky-App/Whisky/assets/42140194/d0a405e8-76ee-48f0-92b5-165d184a576b">

Familiar UI that integrates seamlessly with macOS

<div align="right">
  <img width="650" alt="New Bottle" src="https://github.com/Whisky-App/Whisky/assets/42140194/ed1a0d69-d8fb-442b-9330-6816ba8981ba">

  One-click bottle creation and management
</div>

<img width="650" alt="debug" src="https://user-images.githubusercontent.com/42140194/229176642-57b80801-d29b-4123-b1c2-f3b31408ffc6.png">

Debug and profile with ease

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
