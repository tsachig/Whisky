# Whisky Project Brief

## Project Overview
**Whisky** is a macOS gaming emulator that provides a clean, native graphical interface for running Windows games on Apple Silicon Macs using Wine compatibility layer. While it can run general Windows applications, its primary focus is gaming optimization and performance.

## Current Status
- **Maintenance Status**: Project successfully revived and actively maintained
- **Last Update**: Gaming performance optimization phase completed
- **Current Version**: Based on Wine 7.7 with gaming optimizations (DXVK enabled by default)
- **User Base**: Available via Homebrew, active Discord community, gaming-focused positioning

## Core Purpose
- **Primary**: Enable high-performance Windows gaming on Apple Silicon Macs
- Simplify Wine gaming setup for non-technical Mac users
- Provide native macOS UI for gaming-focused Windows compatibility
- Optimize gaming performance through Wine and Apple's Game Porting Toolkit

## Technical Foundation
- **Language**: Swift with SwiftUI
- **Target Platform**: Apple Silicon Macs (M-series)
- **OS Requirement**: macOS Sonoma 14.0+
- **Architecture**: MVVM pattern with modular design

## Key Gaming Features
- **Gaming-Optimized Bottles**: Wine prefix management tuned for gaming
- **One-Click Game Installation**: Streamlined Windows game setup
- **Advanced Gaming Graphics**: DXVK-macOS, D3DMetal, DirectX 12 raytracing
- **Apple Silicon Gaming**: Game Porting Toolkit integration, ARM64EC support
- **Performance Optimization**: msync, AVX support, Metal HUD/tracing
- **Native macOS Integration**: Gaming-focused UI and shortcuts

## Development History
- Created as user-friendly Wine wrapper
- Built on CrossOver commercial Wine distribution
- Integrated Apple's Game Porting Toolkit
- Achieved significant community adoption
- Discontinued due to maintenance burden

## Recent Achievements
- Active maintenance restored with gaming performance focus
- Swift 6 concurrency issues resolved
- DXVK enabled by default for optimal gaming performance
- Enhanced Metal HUD with real-time performance monitoring
- Build system stability and dependency resolution completed
- Comprehensive gaming documentation and accurate feature descriptions