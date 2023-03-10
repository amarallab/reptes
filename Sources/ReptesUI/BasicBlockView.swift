//
//  BasicBlockView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct BasicBlockView: BlockView {
    var block: any Block
    var actions: [Action]

    public init(block: any Block, actions: [Action]) {
        self.block = block
        self.actions = actions
    }
    
    public static func canRender(block: any Block) -> Bool {
        BlockButtonView.canRender(block: block)
        || BlockImageView.canRender(block: block)
        || BlockMapView.canRender(block: block)
        || BlockMarkdownView.canRender(block: block)
    }

    public var body: some View {
        if BlockButtonView.canRender(block: block) {
            BlockButtonView(block: block, actions: actions)
        } else if BlockImageView.canRender(block: block) {
            BlockImageView(block: block, actions: actions)
        } else if BlockMapView.canRender(block: block) {
            BlockMapView(block: block, actions: actions)
        } else if BlockMarkdownView.canRender(block: block) {
            BlockMarkdownView(block: block, actions: actions)
        } else {
            MissingBlockView(block: block, actions: actions)
        }
    }
}
