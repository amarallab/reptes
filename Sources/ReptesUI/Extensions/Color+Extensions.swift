//
//  Color+Extensions.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import SwiftUI
import Reptes

@available(iOS 13.0, *)
public extension Color {
    #if os(iOS)
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)

    static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    
    #elseif os(macOS)
    static let systemBackground = Color(NSColor.unemphasizedSelectedTextColor)
    static let secondarySystemBackground = Color(NSColor.unemphasizedSelectedTextBackgroundColor)

    static let systemGroupedBackground = Color(NSColor.unemphasizedSelectedContentBackgroundColor)
    static let secondarySystemGroupedBackground = Color(NSColor.unemphasizedSelectedTextBackgroundColor)
    #endif
}
