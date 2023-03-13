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
    @Environment(\.locale) var locale
    var block: any Block

    init(block: any Block, actions: [Action]) {
        self.block = block
    }
    
    static func canRender(block: any Block) -> Bool {
        block is BlockMarkdown
    }
    
    var body: some View {
        if let blockMarkdown = block as? BlockMarkdown {
            VStack(spacing: 0) {
                HStack {
                    Markdown(blockMarkdown.localizedText.text(for: locale))
                        .id(blockMarkdown.localizedText.text(for: locale))
                    Spacer()
                }
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
