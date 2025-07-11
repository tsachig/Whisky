# System Patterns

## Design Patterns Used

### 1. MVVM (Model-View-ViewModel)
- **Views**: SwiftUI views for UI presentation
- **ViewModels**: Business logic and state management (e.g., BottleVM)
- **Models**: Data structures (Bottle, Program, etc.)

### 2. Repository Pattern
- **BottleData**: Manages bottle persistence and operations
- **Wine**: Handles Wine process execution and configuration
- **WhiskyWineInstaller**: Manages Wine installation and updates

### 3. Command Pattern
- **WhiskyCmd**: CLI interface with argument parsing
- **ProgramShortcut**: Encapsulates program execution

### 4. Observer Pattern
- **SwiftUI @Published**: Reactive state updates
- **Sparkle**: Auto-update notifications

## Code Organization Patterns

### 1. Modular Architecture
- Clear separation between UI, business logic, and system integration
- Shared functionality in WhiskyKit framework
- Platform-specific code isolated in respective targets

### 2. Configuration Management
- **BottleSettings**: Wine configuration per bottle
- **ProgramSettings**: Per-program launch settings
- **Constants**: Centralized configuration values

### 3. Error Handling
- **Wine.swift**: Comprehensive error handling for Wine operations
- **WhiskyWineInstaller**: Network and installation error management
- Consistent error propagation through Swift Result types

### 4. Threading Patterns
- **@MainActor**: UI updates on main thread
- **@unchecked Sendable**: Legacy concurrency (needs modernization)
- Background queues for Wine operations

## Wine Integration Patterns

### 1. Process Management
- **Wine.swift**: Centralized Wine process execution
- Environment variable management
- Process lifecycle handling

### 2. Bottle Management
- **Bottle.swift**: Bottle (Wine prefix) abstraction
- **BottleData**: Persistent bottle storage
- Metadata management and versioning

### 3. Program Execution
- **Program.swift**: Windows program abstraction
- **ProgramShortcut**: Launcher implementation
- Icon extraction and management

## Security Patterns

### 1. Sandboxing
- **Entitlements**: Minimal required permissions
- **User consent**: File access through macOS dialogs
- **Isolation**: Wine processes run in separate prefixes

### 2. Input Validation
- **PE parsing**: Safe Windows executable analysis
- **Path validation**: Secure file system access
- **Process arguments**: Sanitized command-line handling

## Performance Patterns

### 1. Lazy Loading
- **Wine installation**: On-demand download and setup
- **Program icons**: Extracted only when needed
- **Bottle creation**: Deferred Wine prefix initialization

### 2. Caching
- **Program metadata**: Cached for quick access
- **Wine version**: Cached to avoid repeated checks
- **Thumbnails**: Generated and cached for QuickLook

### 3. Resource Management
- **Memory**: Proper cleanup of Wine processes
- **File handles**: Automatic resource disposal
- **Network**: Efficient Wine distribution downloads