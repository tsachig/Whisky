# Whisky Project Brief

## Project Overview
**Whisky** is a macOS gaming emulator that provides a clean, native graphical interface for running Windows games on Apple Silicon Macs using Wine compatibility layer. While it can run general Windows applications, its primary focus is gaming optimization and performance.

## Current Status
- **Maintenance Status**: Project officially discontinued by original developers
- **Last Update**: Maintenance notice added (commit fd5480a7)
- **Current Version**: Based on Wine 10.0 (latest release)
- **User Base**: Available via Homebrew, active Discord community

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

## Current Challenge
- No active maintainers
- Updated to Wine 10.0 (latest release with Apple Silicon improvements)
- Potential compatibility issues with newer macOS versions
- Swift 6 concurrency issues in codebase