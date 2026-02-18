# JoJoPlayground

Designer-focused starter kit for AI vibe coding: guided workflow + pre-written rules to keep code aligned with your design. No coding experience required. No built-in design system—bring your own.

Design in Figma, build with Claude Code, preview in Xcode.

---

## Step 1: Set Up

1. Install **Xcode** (free from the Mac App Store)
2. Install **Claude Code** (from [claude.ai/download](https://claude.ai/download))
3. Install the **Figma desktop app** (not the browser version — MCP requires the desktop app)

---

## Step 2: Connect Figma

1. Open the **JoJoPlayground** folder in Claude Code
2. Set up the **Figma MCP** server in your Claude Code MCP settings. If you haven't set up Figma MCP yet, search YouTube for "how to set up Figma MCP in Claude Code" and follow the guide
3. Make sure the **Figma desktop app** is open (not the browser version)
4. Test the connection by asking Claude Code to read a Figma URL

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
2. Share **Figma URLs** with Claude Code (right-click frame > "Copy link to selection")
3. Tell Claude Code what to build — it will generate SwiftUI code using your design system tokens
4. Press **Cmd + R** in Xcode to preview
5. Iterate: make changes in Claude Code, build in Xcode, repeat

---

## Using Cursor Instead of Claude Code?

See **[CURSOR_SETUP.md](CURSOR_SETUP.md)** for a quick setup guide.

---

## References

- **[SPEC.md](SPEC.md)** — Design system tokens, architecture, and conventions
- **[FLOW_TEMPLATE.md](FLOW_TEMPLATE.md)** — Step-by-step guide for adding new flows
- **[CURSOR_SETUP.md](CURSOR_SETUP.md)** — Setup guide for Cursor users
