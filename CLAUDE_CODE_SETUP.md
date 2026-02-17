# Using JoJoPlayground with Claude Code

This project is built for Cursor, but works with Claude Code too. The project files, architecture, and conventions are identical — only the AI rules setup differs.

---

## Setup

1. Open the project folder in **Claude Code**
2. Paste this prompt:

> This project uses Cursor rules at `.cursor/rules/jojoplayground.mdc`. Please create a `CLAUDE.md` file at the project root that follows Claude Code conventions, reusing all the principles, conventions, and rules defined in that cursor rules file.

3. Claude Code will read the cursor rules and generate the equivalent `CLAUDE.md` automatically
4. Enable **Figma MCP** in Claude Code if you want direct Figma integration

---

Everything else — SPEC.md, FLOW_TEMPLATE.md, README.md — works the same regardless of which AI tool you use.
