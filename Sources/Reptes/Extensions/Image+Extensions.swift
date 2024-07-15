//
//  Image+Extensions.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 15/7/24.
//

import Foundation
import SwiftUI

#if os(iOS)
import UIKit
public typealias KYColor = UIColor
public typealias KYImage = UIImage

extension Image {
    public init(kyImage: KYImage) {
        self.init(uiImage: kyImage)
    }
}

#endif

#if os(macOS)
import AppKit
public typealias KYColor = NSColor
public typealias KYImage = NSImage

extension Image {
    public init(kyImage: KYImage) {
        self.init(nsImage: kyImage)
    }
}

public extension KYImage {
    func pngData(
        imageInterpolation: NSImageInterpolation = .high
    ) -> Data? {
        guard let bitmap = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(size.width),
            pixelsHigh: Int(size.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: .deviceRGB,
            bitmapFormat: [],
            bytesPerRow: 0,
            bitsPerPixel: 0
        ) else {
            return nil
        }

        bitmap.size = size
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmap)
        NSGraphicsContext.current?.imageInterpolation = imageInterpolation
        draw(
            in: NSRect(origin: .zero, size: size),
            from: .zero,
            operation: .copy,
            fraction: 1.0
        )
        NSGraphicsContext.restoreGraphicsState()

        return bitmap.representation(using: .png, properties: [:])
    }
}
#endif
