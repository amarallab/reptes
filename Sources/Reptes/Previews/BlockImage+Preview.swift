//
//  BlockImage+Preview.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import SwiftUI

extension BlockImage {
    public static let preview: BlockImage = {
        let trashImage: KYImage?
        #if os(iOS)
            let largeConfig = KYImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
            let data = KYImage(systemName: "trash.circle", withConfiguration: largeConfig)?.pngData()
        #elseif os(macOS)
        let data = NSImage(systemSymbolName: "trask.circle", accessibilityDescription: nil)?.pngData()
        #endif
        if let data {
            trashImage = KYImage(data: data)
        } else {
            trashImage = nil
        }
        return BlockImage(id: UUID(), height: .regular, image: trashImage)
    }()
}
