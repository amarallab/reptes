//
//  BlockImageView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

struct BlockImageView: BlockView {
    var block: any Block

    init(block: any Block, actions: [Action]) {
        self.block = block
    }
    
    static func canRender(block: any Block) -> Bool {
        block is BlockImage
    }
    
    var body: some View {
        if let blockImage = block as? BlockImage {
            if let image = blockImage.image {
                Image(kyImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }
    }
}
