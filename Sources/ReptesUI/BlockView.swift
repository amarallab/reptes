//
//  BlockView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import Reptes
import SwiftUI

public protocol BlockView: View {
    init(block: Block, actions: [Action])
    static func canRender(block: Block) -> Bool
}
