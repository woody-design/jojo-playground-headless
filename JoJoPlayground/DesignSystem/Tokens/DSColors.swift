//
//  DSColors.swift
//  JoJoPlayground
//
//  Design tokens: Colors from your design system.
//  Add your color tokens here. Each token should have a descriptive name
//  and map to a specific hex value from your Figma design system.
//
//  Example:
//    static let primaryBackground = Color(hex: "#ffffff")
//    static let primaryText = Color(hex: "#1a1a1a")
//

import SwiftUI

// MARK: - Color Hex Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Design System Colors

enum DSColors {

    // Add your color tokens here, organized by category.
    // Use MARK comments to group related tokens.
    //
    // Example categories:
    //
    // MARK: Brand
    // static let brandPrimary = Color(hex: "#...")
    //
    // MARK: Grayscale
    // static let grayscale00 = Color.white
    // static let grayscale80 = Color(hex: "#...")
    //
    // MARK: Button
    // static let buttonPrimaryBg = Color(hex: "#...")
    // static let buttonPrimaryContent = Color.white
    // static let buttonDisabledBg = Color(hex: "#...")
    // static let buttonDisabledContent = Color(hex: "#...")
    //
    // MARK: Input
    // static let inputBorder = Color(hex: "#...")
    // static let inputBackground = Color.white
}
