//
//  BasicBlockView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct BasicBlockView: BlockView
{
    var block: Block
    
    public init(block: Block) {
        self.block = block
    }
    
    public static func canRender(block: Block) -> Bool {
        BlockButtonView.canRender(block: block)
        || BlockImageView.canRender(block: block)
        || BlockMapView.canRender(block: block)
        || BlockMarkdownView.canRender(block: block)
    }

    public var body: some View {
        if BlockButtonView.canRender(block: block) {
            BlockButtonView(block: block)
        } else if BlockImageView.canRender(block: block) {
            BlockImageView(block: block)
        } else if BlockMapView.canRender(block: block) {
            BlockMapView(block: block)
        } else if BlockMarkdownView.canRender(block: block) {
            BlockMarkdownView(block: block)
        } else {
            MissingBlockView(block: block)
        }
    }
}
