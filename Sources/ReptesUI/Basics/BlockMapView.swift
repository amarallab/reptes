//
//  BlockMapView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import MapKit
import Reptes
import SwiftUI

struct BlockMapView: BlockView {
    var block: any Block

    init(block: any Block, actions: [Action]) {
        self.block = block
    }
    
    static func canRender(block: any Block) -> Bool {
        block is BlockMap
    }
    
    var body: some View {
        if let blockMap = block as? BlockMap {
            Map(coordinateRegion: .constant(blockMap.coordinateRegion))
                .disabled(true)
                .frame(minHeight: blockMap.height.screenValue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
    }
}
