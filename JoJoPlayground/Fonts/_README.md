# Fonts

Add your custom font files here (TTF or OTF).

## Steps

1. **Export fonts** from your design system (TTF or OTF format)
2. **Drag the font files** into this `Fonts/` directory
3. **Register in Info.plist** — open `Info.plist` in the project, find the "Fonts provided by application" array, and add each font filename (e.g., `YourFont-Regular.ttf`)
4. **Find the PostScript name** — this is the internal name iOS uses to load the font:
   - Open the font file in **Font Book** (double-click it), look for "PostScript Name"
   - Or run in Terminal: `fc-scan --format "%{postscriptname}\n" YourFont-Regular.ttf`
5. **Add to DSTypography** — open `DesignSystem/Tokens/DSTypography.swift` and add the PostScript name as a private static let, then define your type styles

## Example

If your font files are `BrandFont-Regular.ttf` and `BrandFont-Bold.ttf`:

1. Drag both into this folder
2. In Info.plist, add: `BrandFont-Regular.ttf` and `BrandFont-Bold.ttf`
3. Find PostScript names (e.g., `BrandFont-Regular`, `BrandFont-Bold`)
4. In DSTypography.swift:

```swift
private static let brandRegular = "BrandFont-Regular"
private static let brandBold = "BrandFont-Bold"

static let headline = Font.custom(brandBold, size: 24)
static let bodyRegular = Font.custom(brandRegular, size: 14)
```

## Troubleshooting

**Fonts look wrong (system font instead of custom font)**
- In Xcode: Product > Clean Build Folder (Cmd + Shift + K), then run again
- Verify the font filename in Info.plist matches exactly (case-sensitive)
- Verify the PostScript name in DSTypography matches exactly
