# Changelog

## [Unreleased] - Wine 10.0 Gaming Release

### 🎮 Major Gaming Improvements
- **BREAKING**: Updated to Wine 10.0 (from 7.7.0) for massive gaming performance improvements
- **NEW**: ARM64EC support for native Apple Silicon gaming performance
- **NEW**: Enhanced DirectX 12 support with improved raytracing capabilities
- **NEW**: High-DPI gaming support with automatic scaling for modern displays
- **NEW**: Process elevation support ("Run as Administrator") for games requiring elevated permissions

### 🚀 Gaming Performance Enhancements
- **IMPROVED**: DXVK-macOS integration for better DirectX translation
- **IMPROVED**: D3DMetal optimization for Apple Silicon graphics
- **IMPROVED**: MoltenVK support for enhanced Vulkan gaming
- **IMPROVED**: Game Porting Toolkit integration for optimal Apple Silicon gaming
- **IMPROVED**: msync performance optimizations for Apple Silicon

### 🛠️ Technical Improvements
- **FIXED**: Swift 6 concurrency issues in core gaming classes (Program.swift, Bottle.swift, BottleVM.swift)
- **FIXED**: Build system compatibility with Swift 6.1.2
- **IMPROVED**: Package dependencies updated to HTTPS from SSH
- **IMPROVED**: Gaming-focused code quality and structure

### 🎯 Gaming Features
- **ENHANCED**: DirectX 12 raytracing toggle functionality
- **ENHANCED**: Metal HUD and tracing for gaming performance monitoring
- **ENHANCED**: DXVK async support for better gaming performance
- **ENHANCED**: AVX feature support for compatible games
- **MAINTAINED**: All existing gaming configurations and bottle management

### 📚 Documentation
- **NEW**: Gaming-focused documentation and setup guides
- **IMPROVED**: README.md updated for gaming emulator focus
- **IMPROVED**: Technical documentation for gaming developers

### ⚠️ Breaking Changes
- Default Wine version updated from 7.7.0 to 10.0.0 (affects new bottles only)
- Existing bottles will continue to work with their configured Wine version
- Some games may require reconfiguration to take advantage of new features

### 🔧 Developer Notes
- Project now explicitly focused on gaming emulation
- Memory bank documentation updated for gaming context
- Development workflow optimized for gaming features
- Community engagement prepared for gaming-focused feedback

---

## Previous Releases

### [Previous Version] - Maintenance Notice
- Added maintenance notice
- Bug fixes for program configuration view freezes
- External volume support for pinned programs
- Crowdin localization updates
- DXR support toggle implementation
- AVX feature switch implementation

---

**Note**: This is a major gaming-focused release. While we've maintained compatibility with existing bottles and configurations, we recommend testing your gaming setup before upgrading production systems.