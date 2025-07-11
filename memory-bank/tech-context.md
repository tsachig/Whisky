# Technical Context

## Architecture Overview
**Whisky** follows a modular architecture with clear separation of concerns:

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
- **Wine 7.7.0** - Windows compatibility layer (based on CrossOver 22.1.1)
- **Sparkle** - Auto-update framework
- **SemanticVersion** - Version management
- **ArgumentParser** - CLI argument parsing
- **SwiftyTextTable** - Table formatting utilities

### Wine Integration
- **Custom Distribution**: WhiskyWine hosted at data.getwhisky.app
- **Installation Path**: ~/Application Support/app.getwhisky.app/Libraries/Wine/
- **Graphics Stack**: DXVK-macOS, MoltenVK, D3DMetal
- **Sync Method**: msync (Apple Silicon optimized)

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

### System Requirements
- **CPU**: Apple Silicon (M-series) only
- **OS**: macOS Sonoma 14.0+
- **Graphics**: Metal support required
- **Memory**: Sufficient for Wine and Windows applications