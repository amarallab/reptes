//
//  JSONColor.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/22/22.
//

import Foundation
import SwiftUI

public struct JSONColor: Codable, Hashable, Equatable {
    public var red: Double
    public var green: Double
    public var blue: Double
    public var opacity: Double
    
    public var color: Color { .init(red: red, green: green, blue: blue, opacity: opacity) }
    public var uiColor: KYColor { .init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(opacity)) }
    
    public init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    public init(color: Color) {
        self.init(uiColor: KYColor(color))
    }
    
    public init(uiColor: KYColor) {
        var r: CGFloat = .zero
        var g: CGFloat = .zero
        var b: CGFloat = .zero
        var a: CGFloat = .zero
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.init(red: Double(r), green: Double(g), blue: Double(b), opacity: Double(a))
    }

}
