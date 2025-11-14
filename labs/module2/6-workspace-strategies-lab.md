# Lab 6: Strategic Use of Workspace

## Overview

In this lab, you will learn how to effectively use GitHub Copilot's workspace features to navigate and understand large codebases. You'll work with a large, multi-language project to develop strategies for efficient code exploration.

## Setup

For this lab, you'll work with a large codebase. You can use:
- **OpenStack** (recommended for this lab): A large, multi-language cloud platform
- **Linux Kernel**: For systems programming exploration
- **Any large project** you're interested in (10,000+ files)

Clone a large repository:
```bash
# Example: OpenStack Cinder (Block Storage)
git clone https://github.com/openstack/cinder.git
cd cinder
```

Ensure GitHub Copilot is enabled and supports workspace commands in your IDE.

## Understanding Workspace Context

Large codebases present challenges:
- Limited context window for AI models
- Multi-language projects (Python, C++, JavaScript, etc.)
- Thousands of files to search through
- Complex dependencies and relationships

The workspace feature helps AI understand your entire codebase context.

## Tasks

### Task 1: Explore Without Constraints

1. Open the large codebase in your IDE
2. Try asking a broad question without workspace context:
   ```
   "Where is logging enabled?"
   ```
3. Note the quality and specificity of the response
4. Observe if Copilot struggles with the broad scope

### Task 2: Use Workspace for Broad Searches

1. Enable or explicitly use workspace context (often enabled by default)
2. Ask the same question using workspace:
   ```
   "@workspace Where is logging enabled?"
   ```
3. Compare the response to your previous attempt
4. Note how many files were referenced
5. Review the accuracy of the information

### Task 3: Narrow Your Scope

1. Identify a specific subdirectory or module (e.g., `cinder/volume`)
2. Ask a focused question about that area:
   ```
   "@workspace In the cinder/volume directory, how is logging configured?"
   ```
3. Compare the response quality to broader searches
4. Note the improvement in specificity and relevance

### Task 4: Use Fuzzy Path Matching

1. When you don't know exact paths, use partial names:
   ```
   "@workspace In files matching **/volume/**, how are drivers initialized?"
   ```
2. Let Copilot find relevant files using pattern matching
3. Refine your search based on results
4. Document the files Copilot identified

### Task 5: Multi-Language Navigation

1. Identify what languages exist in your codebase:
   ```
   "@workspace What programming languages are used in this project?"
   ```
2. Ask language-specific questions:
   ```
   "@workspace Show me how Python logging is configured"
   "@workspace Show me C++ error handling patterns"
   ```
3. Compare how Copilot handles different languages

### Task 6: Find Cross-File Dependencies

1. Select a specific function or class
2. Ask about its usage across the codebase:
   ```
   "@workspace Where is the VolumeDriver class used?"
   ```
3. Review all the locations Copilot identifies
4. Verify the results by spot-checking a few files

### Task 7: Discover Patterns

1. Ask about architectural patterns:
   ```
   "@workspace What design patterns are used for error handling?"
   "@workspace How are configuration files loaded?"
   ```
2. Use Copilot to understand the codebase architecture
3. Document common patterns you discover

## Expected Outcomes

By the end of this lab, you should:
- Understand when to use workspace context
- Know how to narrow searches for better results
- Be able to navigate large codebases efficiently
- Recognize limitations of broad vs. focused queries

## Best Practices

1. **Start Narrow**: Begin with specific directories when possible
2. **Use Path Patterns**: Leverage wildcards and path matching
3. **Iterate**: Refine questions based on initial results
4. **Verify**: Always spot-check AI-provided information
5. **Context Matters**: Include relevant files in your editor
6. **Language-Specific**: Separate queries by language in multi-language projects

## Workspace Strategies

| Scenario | Strategy | Example |
|----------|----------|---------|
| Unknown codebase | Broad workspace query | `@workspace What does this project do?` |
| Specific feature | Narrow to directory | `@workspace In /src/api/, how are endpoints defined?` |
| Finding patterns | Pattern matching | `@workspace In **/*test*.py, what testing framework is used?` |
| Cross-cutting concerns | Full workspace | `@workspace Where is authentication implemented?` |
| Performance concerns | Targeted search | Limit to specific modules |

## Reflection Questions

1. How did workspace context improve AI responses?
2. What was the optimal level of scope for your queries?
3. When did broad queries work better than narrow ones?
4. How many files is too many for effective context?
5. What strategies worked best for your specific codebase?

## Deliverables

Document your findings:
1. List of successful workspace queries and their results
2. Comparison of broad vs. narrow search effectiveness
3. Map of key areas in the codebase you explored
4. Best practices specific to your project type

## Advanced Exercise

If time permits:
1. Create a "codebase guide" document using workspace queries
2. Map out the architecture using AI assistance
3. Identify technical debt or inconsistencies across modules
4. Generate a dependency graph of major components

## Next Steps

In the next lab, you'll learn how to analyze cross-file dependencies in detail and understand how components interact across a large codebase.
