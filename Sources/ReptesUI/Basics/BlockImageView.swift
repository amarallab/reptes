//
//  BlockImageView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import SwiftUI
import Reptes

struct BlockImageView: BlockView {
    var block: Block
    
    static func canRender(block: Block) -> Bool {
        block is BlockImage
    }
    
    var body: some View {
        if let blockImage = block as? BlockImage {
            if let image = blockImage.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }
    }
}
