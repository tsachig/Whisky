# Technical Context

## Architecture Overview
**Whisky** is a gaming-focused Windows emulator that follows a modular architecture optimized for gaming performance:

### Core Components
1. **Whisky** - Main SwiftUI application
2. **WhiskyKit** - Core functionality library
3. **WhiskyCmd** - Command-line interface
4. **WhiskyThumbnail** - QuickLook thumbnail provider

### Technology Stack
- **Swift 6** - Primary programming language
- **SwiftUI** - Native macOS UI framework
- **MVVM Pattern** - Clean architecture separation
- **Swift Package Manager** - Dependency management

### Key Dependencies
- **Wine 7.7** - Current Windows compatibility layer (stable, gaming-optimized)
- **Wine 10.0** - Target upgrade with ARM64EC support (in development)
- **Sparkle** - Auto-update framework
- **SemanticVersion** - Version management
- **ArgumentParser** - CLI argument parsing
- **SwiftyTextTable** - Table formatting utilities

### Gaming-Optimized Wine Integration
- **Custom Distribution**: WhiskyWine hosted at data.getwhisky.app (gaming-optimized)
- **Installation Path**: ~/Application Support/app.getwhisky.app/Libraries/Wine/
- **Gaming Graphics Stack**: DXVK-macOS, MoltenVK, D3DMetal, DirectX 12 raytracing
- **Performance Optimizations**: msync (Apple Silicon optimized), AVX support
- **Apple Gaming Integration**: Game Porting Toolkit, ARM64EC support

### File Structure
```
Whisky/
├── Whisky/                    # Main application
│   ├── Views/                 # SwiftUI views
│   ├── View Models/           # MVVM view models
│   └── Utils/                 # Utility classes
├── WhiskyKit/                 # Core library
│   ├── Whisky/               # Business logic
│   ├── Wine/                 # Wine integration
│   └── PE/                   # Windows PE parsing
├── WhiskyCmd/                 # CLI interface
└── WhiskyThumbnail/          # QuickLook extension
```

### Build System
- **Xcode 15** - Primary IDE
- **SwiftLint** - Code quality enforcement
- **GitHub Actions** - CI/CD pipeline
- **Crowdin** - Localization management

### Gaming System Requirements
- **CPU**: Apple Silicon (M-series) only (gaming-optimized)
- **OS**: macOS Sonoma 14.0+
- **Graphics**: Metal support required (gaming graphics stack)
- **Memory**: Sufficient for Wine and Windows gaming applications
- **Gaming Features**: DirectX 12, Vulkan, Metal HUD/tracing support