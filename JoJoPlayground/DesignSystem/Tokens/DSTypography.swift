//
//  DSTypography.swift
//  JoJoPlayground
//
//  Design tokens: Typography from your design system.
//
//  How to set up custom fonts:
//  1. Export font files (TTF or OTF) from your design system
//  2. Drag them into the Fonts/ directory in this project
//  3. Register each font filename in Info.plist under
//     "Fonts provided by application" (the array is already set up)
//  4. Find the PostScript name for each font:
//     - Open the font in Font Book, look at the PostScript Name field
//     - Or run in Terminal: fc-scan --format "%{postscriptname}\n" YourFont.ttf
//  5. Add the PostScript name as a private static let below
//  6. Define your type styles using Font.custom(name, size:)
//
//  Example:
//    private static let headingSemiBold = "YourFont-SemiBold"
//    static let headline = Font.custom(headingSemiBold, size: 24)
//    static let headlineLineHeight: CGFloat = 28
//

import SwiftUI

enum DSTypography {

    // MARK: - Font Family Names (PostScript names from your font files)

    // Add your PostScript font names here:
    // private static let headingSemiBold = "YourFont-SemiBold"
    // private static let bodyRegular = "YourFont-Regular"

    // MARK: - Type Styles

    // Add your type styles here. Each style should include:
    // - A Font value using Font.custom(name, size:)
    // - A lineHeight value as CGFloat
    //
    // Example:
    //
    // /// Headline: YourFont SemiBold, 24px, lineHeight 28px
    // /// Used for: Screen titles
    // static let headline = Font.custom(headingSemiBold, size: 24)
    // static let headlineLineHeight: CGFloat = 28
    //
    // /// Title: YourFont SemiBold, 18px, lineHeight 22px
    // /// Used for: Section titles
    // static let title = Font.custom(headingSemiBold, size: 18)
    // static let titleLineHeight: CGFloat = 22
    //
    // /// Body Regular: YourFont Regular, 14px, lineHeight 20px
    // /// Used for: Body text, descriptions
    // static let bodyRegular = Font.custom(bodyRegular, size: 14)
    // static let bodyLineHeight: CGFloat = 20
    //
    // /// Button: YourFont SemiBold, 16px, lineHeight 16px
    // /// Used for: Button labels
    // static let button = Font.custom(headingSemiBold, size: 16)
    // static let buttonLineHeight: CGFloat = 16
}
