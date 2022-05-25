//
//  CompositeBlockView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct CompositeBlockView<T1, T2>: BlockView
    where T1 : BlockView,
          T2 : BlockView
{
    var block: Block
    var actions: [Action]
    
    public init(block: Block, actions: [Action]) {
        self.block = block
        self.actions = actions
    }
    
    public static func canRender(block: Block) -> Bool {
        T1.canRender(block: block)
        || T2.canRender(block: block)
    }

    public var body: some View {
        if T1.canRender(block: block) {
            T1(block: block, actions: actions)
        } else if T2.canRender(block: block) {
            T2(block: block, actions: actions)
        } else {
            MissingBlockView(block: block, actions: actions)
        }
    }
}
