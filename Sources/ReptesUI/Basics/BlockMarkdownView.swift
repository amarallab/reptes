//
//  BlockMarkdownView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import MarkdownUI
import Reptes
import SwiftUI

struct BlockMarkdownView: BlockView {
    var block: Reptes.Block

    init(block: Reptes.Block, actions: [Action]) {
        self.block = block
    }
    
    static func canRender(block: Reptes.Block) -> Bool {
        block is BlockMarkdown
    }
    
    var body: some View {
        if let blockMarkdown = block as? BlockMarkdown {
            VStack(spacing: 0) {
                Markdown(blockMarkdown.localizedText.text)
                    .id(blockMarkdown.localizedText.text)
                if blockMarkdown.underlined ?? false {
                    Divider()
                }
            }
            .padding(.vertical)
            .padding(.horizontal, (blockMarkdown.backgroundTransparent ?? false) ? CGFloat(0.0) : nil)
            .background((blockMarkdown.backgroundTransparent ?? false) ? Color.clear :  Color.secondarySystemGroupedBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
    }
}
