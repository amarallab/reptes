//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct EmptyBlockView: BlockView {
    public init(block: Block) {
    }
    
    public static func canRender(block: Block) -> Bool {
        false
    }

    public var body: some View {
        EmptyView()
    }
}
