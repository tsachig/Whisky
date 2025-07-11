# CRITICAL: Read this file FIRST before any work

# Memory Bank Integration
Before starting any work, ALWAYS read the memory-bank/ folder files to understand:
- Project context and development history (project-brief.md)
- Technical architecture and patterns (tech-context.md, system-patterns.md)  
- Current development status (active-context.md)
- User workflow preferences (user-preferences.md)
- Feature status and known issues (progress.md)

This memory bank provides persistent context across Claude Code sessions, ensuring continuity and avoiding rediscovery of project knowledge.

# Workflow Enforcement
STOP: If I start working without reading memory-bank/ files first, interrupt me and remind me to follow this workflow.

1. First think through the problem, read the codebase, README.md, and memory-bank/ files for context, then create a plan using the TodoWrite tool.
2. Use the TodoWrite tool for internal workflow tracking and task management throughout the process.
3. Before you begin working, check in with me and I will verify the plan.
4. Then, begin working on the todo items, marking them as complete as you go.
5. If you encounter errors or blockers, update the TodoWrite status accordingly and communicate the issue clearly before proceeding.
6. Please every step of the way just give me a high level explanation of what changes you made.
7. Make every task and code change you do as simple as possible. We want to avoid making any massive or complex changes. Every change should impact as little code as possible. Everything is about simplicity.
8. After completing changes, validate the work by running any existing tests, checking basic functionality, or using other appropriate quality checks for the project.
9. When making significant changes to functionality, update the README.md file to reflect new features, usage instructions, or technical details.
10. The README.md file serves as the primary project documentation for future context and should be kept current with major changes.
11. Mark tasks complete in TodoWrite only when fully implemented and validated. Provide a brief summary when all planned work is finished.

# Documentation Requirements
CRITICAL: Any new user-facing functionality MUST be documented in README.md before the feature is considered complete.

## Feature Documentation Checklist
When adding ANY new feature, menu option, or user-facing functionality, you MUST complete this checklist:

### ✅ Required Documentation Updates:
1. **README.md Feature Section** - Add detailed feature description with capabilities
2. **README.md Menu Updates** - Update all menu references to include new option
3. **README.md Usage Examples** - Add comprehensive example output showing the feature in action
4. **README.md Technical Details** - Add "How It Works" section explaining the technical implementation
5. **README.md File Structure** - Document any new files or data sources the feature uses
6. **Console Session Examples** - Update any console menu examples to reflect new option numbers

### ✅ Documentation Validation:
1. **Cross-Reference Check** - Verify all menu options in code match those documented in README.md
2. **Example Accuracy** - Ensure example outputs accurately reflect actual feature behavior
3. **Feature Completeness** - Confirm all user-accessible features are documented
4. **Technical Accuracy** - Validate that technical descriptions match actual implementation

### ✅ Memory Bank Updates:
1. **progress.md** - Update feature status to reflect new functionality
2. **active-context.md** - Note any ongoing development or known issues

## Documentation Standards by Change Type:

### User-Facing Features (MANDATORY README.md updates):
- New menu options or analysis tools
- New command-line options or interfaces
- New file format support
- New output formats or reporting features
- Changes to user workflow or interaction

### Internal Changes (README.md updates optional):
- Code refactoring without user-visible changes
- Performance optimizations
- Internal bug fixes
- Development tooling changes

### Bug Fixes (README.md updates when relevant):
- If the bug affected documented behavior, update documentation
- If the fix changes user-visible behavior, document the change

## Failure Prevention:
- **Before marking any feature complete**: Verify README.md has been updated
- **Before submitting work**: Cross-check that all user-accessible features are documented
- **Red flag**: If you implement a new menu option but don't update README.md, STOP and fix documentation

This ensures documentation stays current and users have complete information about all available features.