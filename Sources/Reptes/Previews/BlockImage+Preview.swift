//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import SwiftUI

extension BlockImage {
    public static let preview: BlockImage = {
        let trashImage: UIImage?
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        if let data = UIImage(systemName: "trash.circle", withConfiguration: largeConfig)?.pngData() {
            trashImage = UIImage(data: data)
        } else {
            trashImage = nil
        }
        return BlockImage(id: UUID(), height: .regular, image: trashImage)
    }()
}
