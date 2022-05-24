//
//  File.swift
//  
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
    
    public init(block: Block) {
        self.block = block
    }
    
    public static func canRender(block: Block) -> Bool {
        T1.canRender(block: block)
        || T2.canRender(block: block)
    }

    public var body: some View {
        if T1.canRender(block: block) {
            T1(block: block)
        } else if T2.canRender(block: block) {
            T2(block: block)
        } else {
            MissingBlockView(block: block)
        }
    }
}
