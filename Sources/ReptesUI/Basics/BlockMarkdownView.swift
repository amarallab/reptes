//
//  BlockMarkdownView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import MarkdownUI
import Reptes
import SwiftUI

public struct AccessibilityMarkdownStyle: MarkdownStyle {
    public let font: MarkdownStyle.Font
    public let foregroundColor: MarkdownStyle.Color
    public let codeFontName: String?
    public let codeFontSizeMultiple: CGFloat
    public let headingFontSizeMultiples: [CGFloat]

    public init(font: MarkdownStyle.Font = .system(.body), foregroundColor: MarkdownStyle.Color = .label, codeFontName: String? = nil, codeFontSizeMultiple: CGFloat = 0.94, headingFontSizeMultiples: [CGFloat] = [2, 1.5, 1.17, 1, 0.83, 0.67]) {
        self.font = font
        self.foregroundColor = foregroundColor
        self.codeFontName = codeFontName
        self.codeFontSizeMultiple = codeFontSizeMultiple
        self.headingFontSizeMultiples = headingFontSizeMultiples
    }
}

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
                Markdown(Document(blockMarkdown.localizedText.text))
                    .markdownStyle(AccessibilityMarkdownStyle())
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
