# Lab 7: Analyzing Cross-File Dependencies

## Overview

In this lab, you will learn how to use GitHub Copilot to understand and analyze dependencies between files and modules in large codebases. You'll trace how components interact and identify coupling issues.

## Setup

Continue working with the large codebase from Lab 6, or choose another complex project:
- OpenStack components (Cinder, Nova, Neutron)
- Large web frameworks (Django, Rails)
- System software (PostgreSQL, Redis)

Ensure you have:
- GitHub Copilot enabled with workspace support
- The codebase cloned and indexed in your IDE
- Understanding of workspace strategies from Lab 6

## Understanding Cross-File Dependencies

Dependencies include:
- **Import/Include statements**: Direct code dependencies
- **Function calls**: How modules use each other
- **Data flow**: How data moves between components
- **Inheritance hierarchies**: Class relationships
- **Configuration dependencies**: How components are configured together

## Tasks

### Task 1: Identify a Starting Point

1. Choose a core functionality to analyze
2. Find the entry point file. For example:
   ```
   "@workspace Where does the PII redaction process start?"
   ```
3. Open the identified file(s)
4. Document the entry point

### Task 2: Trace Function Calls

1. Select a key function in your entry point
2. Ask Copilot about its dependencies:
   ```
   "@workspace What other functions does this function call?"
   ```
3. Create a list of direct dependencies
4. For each dependency, ask where it's defined:
   ```
   "@workspace Where is this function defined?"
   ```
5. Build a call graph on paper or in a document

### Task 3: Analyze Import Chains

1. Look at the import statements in your entry point file
2. Ask about each imported module
3. Trace imports recursively for 2-3 levels
4. Identify circular dependencies or unusual patterns
5. Document the import hierarchy

### Task 4: Find All Usages

1. Select a class or function that seems widely used
2. Find all locations where it's referenced:
3. Count the number of dependencies
4. Assess whether the component is tightly or loosely coupled

### Task 5: Analyze Data Flow

1. Pick a data structure (e.g., a configuration object)
2. Trace how it flows through the system:
   ```
   "@workspace How is the struct passed between functions?"
   ```
3. Identify where the data is:
   - Created/initialized
   - Modified
   - Read
   - Deleted
4. Map the data flow path


## Expected Outcomes

By the end of this lab, you should:
- Be able to trace dependencies across files
- Understand component coupling in large systems
- Know how to identify circular dependencies
- Have mapped key data flows in your codebase

## Deliverables

Create a dependency analysis document including:
1. **Dependency Graph**: Visual or text representation of module relationships
2. **Coupling Assessment**: List of tightly coupled components
3. **Data Flow Diagrams**: How key data structures move through the system
4. **Refactoring Recommendations**: Suggestions for reducing coupling
5. **Cross-File Interaction Patterns**: Common patterns you discovered

## Analysis Template

For each component analyzed:
```markdown
### Component: [Name]

**Direct Dependencies**: [List of modules/files it imports]
**Dependent Components**: [What depends on this component]
**Coupling Score**: [Number of dependencies in + out]
**Circular Dependencies**: [Yes/No, details]
**Refactoring Suggestions**: [Ideas for improvement]
```

## Reflection Questions

1. What surprised you about the dependency structure?
2. Which components are most tightly coupled?
3. Did you find any unnecessary dependencies?
4. How well does the architecture support changes?
5. Where would you focus refactoring efforts?

## Common Dependency Patterns

Look for these patterns:
- **Layered Architecture**: Clear separation of concerns
- **Hub-and-Spoke**: Central component with many dependencies
- **Mesh**: Highly interconnected components (potential code smell)
- **Plugin Architecture**: Loose coupling through interfaces

## Advanced Exercise

If time permits:
1. Generate a visual dependency graph using tools like `graphviz`
2. Use Copilot to help write a script that analyzes imports automatically
3. Compare the current architecture to ideal patterns
4. Propose a refactoring plan to reduce coupling

## Next Steps

In the next lab, you'll apply your knowledge to perform system-wide code cleanup and refactoring across multiple files.
