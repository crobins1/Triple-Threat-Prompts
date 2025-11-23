# Contributing to Triple-Threat Content Strategy Agent

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Development Setup](#development-setup)
- [Contribution Guidelines](#contribution-guidelines)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)

---

## Code of Conduct

This project follows a simple code of conduct:

- Be respectful and constructive in all interactions
- Focus on what is best for the community and end users
- Show empathy towards other community members
- Accept constructive criticism gracefully

---

## How to Contribute

There are many ways to contribute to this project:

### 1. Report Bugs

If you find a bug, please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs. actual behavior
- Your environment (n8n version, Anthropic model, etc.)
- Error messages or screenshots if applicable

### 2. Suggest Enhancements

Have an idea for improvement? Open an issue with:
- Clear description of the enhancement
- Use case or problem it solves
- Proposed implementation approach (if you have one)

### 3. Improve Documentation

Documentation improvements are always welcome:
- Fix typos or clarify confusing sections
- Add examples or use cases
- Improve setup instructions
- Translate documentation

### 4. Contribute Code

Code contributions are welcome for:
- Bug fixes
- New features
- Performance improvements
- Test coverage improvements
- Workflow optimizations

---

## Development Setup

### Prerequisites

- n8n instance (Cloud or self-hosted)
- Anthropic API account with credits
- Git for version control
- Text editor (VS Code, Sublime, etc.)
- Basic knowledge of JSON and system prompts

### Local Setup

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/Triple-Threat-Prompts.git
   cd Triple-Threat-Prompts
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Import workflows to your n8n instance**
   - Import `workflows/main-content-workflow.json`
   - Import `workflows/refinement-workflow.json`
   - Configure Anthropic credentials

5. **Test your setup**
   ```bash
   # Bash test scripts
   ./scripts/test-content-generation.sh YOUR_WEBHOOK_URL YOUR_API_KEY

   # Or Python test script
   python3 scripts/test-workflow.py YOUR_WEBHOOK_URL YOUR_API_KEY
   ```

---

## Contribution Guidelines

### System Prompts (`/prompts/*.md`)

When modifying system prompts:

1. **Maintain Structure**: Keep the existing sections (Role & Mission, Framework, Output Format, etc.)
2. **Test Thoroughly**: Run at least 3 test queries to verify output quality
3. **Document Changes**: Explain what you changed and why in your PR
4. **Preserve JSON Schema**: If modifying Stage 1, ensure JSON output structure remains valid
5. **Consider Token Usage**: Be mindful of prompt length (impacts API costs)

**Example:**
```markdown
## Bad
Changed the prompt to make it better

## Good
Modified Stage 1 competitive analysis section to include SEO metrics analysis.
This addresses issue #123 where users requested keyword opportunity identification.
Added "seo_opportunities" field to JSON output schema.
Tested with 5 different industries, avg response time: 45 seconds.
```

### Workflow JSON (`/workflows/*.json`)

When modifying workflows:

1. **Export from n8n**: Always export workflows from a working n8n instance
2. **Remove Credentials**: Ensure no API keys or sensitive data in the JSON
3. **Test Import**: Verify the workflow can be imported to a fresh n8n instance
4. **Document Node Changes**: List any new nodes or configuration changes
5. **Maintain Compatibility**: Note any n8n version requirements

### Documentation (`/docs/*.md`, `README.md`)

For documentation changes:

1. **Use Clear Language**: Write for beginners, avoid jargon
2. **Include Examples**: Code examples should be copy-paste ready
3. **Test Instructions**: Follow your own instructions in a fresh environment
4. **Update Table of Contents**: If adding new sections
5. **Check Links**: Ensure all links work

### Scripts (`/scripts/*`)

For test or utility scripts:

1. **Add Usage Instructions**: Include help text and examples
2. **Error Handling**: Scripts should fail gracefully with clear errors
3. **Cross-Platform**: Test on macOS, Linux, and Windows (if applicable)
4. **Dependencies**: Document any required tools (jq, curl, python packages)

---

## Testing

### Manual Testing

Before submitting code changes:

1. **Test Content Generation**
   ```bash
   ./scripts/test-content-generation.sh YOUR_URL YOUR_KEY
   ```

2. **Test Performance Analysis**
   ```bash
   ./scripts/test-performance-analysis.sh YOUR_URL YOUR_KEY
   ```

3. **Test Full Suite**
   ```bash
   python3 scripts/test-workflow.py YOUR_URL YOUR_KEY
   ```

### Validation Checklist

- [ ] Workflows import successfully to n8n
- [ ] All test scripts pass
- [ ] No credentials or API keys in code
- [ ] Documentation updated if behavior changed
- [ ] Example files updated if input/output changed
- [ ] No broken links in documentation

---

## Submitting Changes

### Pull Request Process

1. **Update your fork**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Commit your changes**
   ```bash
   git add .
   git commit -m "Clear description of changes"
   ```

3. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

4. **Create Pull Request**
   - Go to the original repository on GitHub
   - Click "New Pull Request"
   - Select your feature branch
   - Fill out the PR template (see below)

### Pull Request Template

```markdown
## Description
Brief description of what this PR does

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Other (describe):

## Changes Made
- Detailed list of changes
- Include any breaking changes

## Testing Performed
- Describe how you tested these changes
- Include test results or screenshots

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have tested my changes
- [ ] I have updated documentation as needed
- [ ] I have added examples if applicable
- [ ] No credentials or sensitive data in code
- [ ] All tests pass

## Related Issues
Fixes #(issue number)
```

### Commit Message Guidelines

Use clear, descriptive commit messages:

```bash
# Good
git commit -m "Add SEO metrics to Stage 1 competitive analysis"
git commit -m "Fix JSON parsing error in Stage 2 output formatting"
git commit -m "Update setup guide with Docker Compose instructions"

# Bad
git commit -m "fixed bug"
git commit -m "updates"
git commit -m "wip"
```

---

## Style Guidelines

### System Prompts

- Use clear, directive language ("You are...", "You must...")
- Structure with markdown headers (##, ###)
- Include examples in code blocks
- Use bold for emphasis on key instructions
- Keep lines under 100 characters where possible

### JSON Formatting

- Use 2-space indentation
- Sort keys alphabetically where logical
- Include comments (as JSON5) for complex structures
- Validate JSON with `jq` or similar tool

### Documentation

- Use ATX-style headers (`#`, `##`, not underlines)
- Include table of contents for long docs
- Use code blocks with language hints (```bash, ```json)
- Keep paragraphs short and scannable
- Use numbered lists for sequences, bullets for options

---

## Getting Help

If you're stuck or have questions:

1. **Check existing documentation** in `/docs/`
2. **Search existing issues** on GitHub
3. **Open a discussion** for questions (not bugs)
4. **Join the community** (Discord/Slack link if available)

---

## Recognition

Contributors will be recognized in:
- `CONTRIBUTORS.md` file (if we create one)
- Release notes for significant contributions
- Project README for major features

---

## License

By contributing, you agree that your contributions will be licensed under the same MIT License that covers the project.

---

**Thank you for contributing to Triple-Threat Content Strategy Agent!**

Your improvements help everyone create better content strategies with AI.
