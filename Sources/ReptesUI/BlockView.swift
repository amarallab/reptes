//
//  BlockView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import SwiftUI
import Reptes

public protocol BlockView: View {
    init(block: Block)
    static func canRender(block: Block) -> Bool
}
