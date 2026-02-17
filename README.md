# JoJoPlayground

Designer-focused starter kit for AI vibe coding: guided workflow + pre-written rules to keep code aligned with your design. No coding experience required. No built-in design system—bring your own.

Design in Figma, build in Cursor, preview in Xcode.

---

## Step 1: Set Up

1. Install **Xcode** (free from the Mac App Store)
2. Install **Cursor** (from [cursor.sh](https://cursor.sh))
3. Install the **Figma desktop app** (not the browser version — MCP requires the desktop app)

---

## Step 2: Connect Figma

1. Open the **JoJoPlayground** folder in Cursor
2. Go to **Cursor Settings > Tools & MCP**. If there's no Figma MCP set up yet, search YouTube for "how to set up Figma MCP in Cursor" and follow the guide
3. Find the **Figma** entry — toggle it **off**, wait a few seconds, then toggle it **back on** (this would reslove most mcp issues)
4. Confirm the Figma MCP shows **green** (connected)

---

## Step 3: Add Your Design System

1. **Add fonts** — see `Fonts/_README.md` for step-by-step instructions
2. **Define color tokens** — Follow youtube instruction or prompt the AI to add it
3. **Define typography tokens** — Follow youtube instruction or prompt the AI to add it
4. **Define spacing tokens** — Follow youtube instruction or prompt the AI to add it
5. **Update SPEC.md** — Prompt AI to fill in the token tables in Section 5 so the AI knows your design system

---

## Step 4: Design & Build

1. Design your screens in **Figma** following the conventions in SPEC.md
2. Share **Figma URLs** with Cursor (right-click frame > "Copy link to selection")
3. Tell Cursor what to build — it will generate SwiftUI code using your design system tokens
4. Press **Cmd + R** in Xcode to preview
5. Iterate: make changes in Cursor, build in Xcode, repeat

---

## Using Claude Code Instead of Cursor?

See **CLAUDE_CODE_SETUP.md** for a quick setup guide.

---

## References

- **[SPEC.md](SPEC.md)** — Design system tokens, architecture, and conventions
- **[FLOW_TEMPLATE.md](FLOW_TEMPLATE.md)** — Step-by-step guide for adding new flows
- **[CLAUDE_CODE_SETUP.md](CLAUDE_CODE_SETUP.md)** — Setup guide for Claude Code users
