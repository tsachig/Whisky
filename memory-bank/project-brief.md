# Whisky Project Brief

## Project Overview
**Whisky** is a macOS application that provides a clean, native graphical interface for running Windows applications and games on Apple Silicon Macs using Wine compatibility layer.

## Current Status
- **Maintenance Status**: Project officially discontinued by original developers
- **Last Update**: Maintenance notice added (commit fd5480a7)
- **Current Version**: Based on CrossOver 22.1.1 and Wine 7.7.0
- **User Base**: Available via Homebrew, active Discord community

## Core Purpose
- Simplify Wine usage for non-technical Mac users
- Provide native macOS UI for Windows app compatibility
- Enable gaming on Apple Silicon through Wine and Apple's Game Porting Toolkit

## Technical Foundation
- **Language**: Swift with SwiftUI
- **Target Platform**: Apple Silicon Macs (M-series)
- **OS Requirement**: macOS Sonoma 14.0+
- **Architecture**: MVVM pattern with modular design

## Key Features
- Bottle (Wine prefix) management
- One-click Windows app installation
- Gaming optimization with DXVK and D3DMetal
- Native macOS integration
- Program shortcuts and pins

## Development History
- Created as user-friendly Wine wrapper
- Built on CrossOver commercial Wine distribution
- Integrated Apple's Game Porting Toolkit
- Achieved significant community adoption
- Discontinued due to maintenance burden

## Current Challenge
- No active maintainers
- Outdated Wine version (7.7.0 vs latest 9.0+)
- Potential compatibility issues with newer macOS versions
- Swift 6 concurrency issues in codebase