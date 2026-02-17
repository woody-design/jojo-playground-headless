# JoJoPlayground

Design in Figma, build in Cursor, preview in Xcode.

---

## Step 1: Set Up

1. Install **Xcode** (free from the Mac App Store)
2. Install **Cursor** (from [cursor.sh](https://cursor.sh))
3. Install the **Figma desktop app** (not the browser version — MCP requires the desktop app)

---

## Step 2: Test

1. Open **JoJoPlayground.xcodeproj** in Xcode
2. In the top toolbar, select a **simulator** (e.g., iPhone 16)
3. Press **Cmd + R** to build and run
4. You should see the default "Hello, world!" screen — this confirms the project works

---

## Step 3: Connect Figma

1. Open the **JoJoPlayground** folder in Cursor
2. Go to **Cursor Settings > Tools & MCP**. If there's no Figma MCP set up yet, search YouTube for "how to set up Figma MCP in Cursor" and follow the guide
3. Find the **Figma** entry — toggle it **off**, wait a few seconds, then toggle it **back on**
4. Confirm the Figma MCP shows **green** (connected)

---

## Step 4: Add Your Design System

1. **Add fonts** — see `Fonts/_README.md` for step-by-step instructions
2. **Define color tokens** — open `DesignSystem/Tokens/DSColors.swift` and add your colors
3. **Define typography tokens** — open `DesignSystem/Tokens/DSTypography.swift` and add your type styles
4. **Define spacing tokens** — open `DesignSystem/Tokens/DSSpacing.swift` and add your spacing scale
5. **Update SPEC.md** — fill in the token tables in Section 5 so the AI knows your design system

---

## Step 5: Design & Build

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
