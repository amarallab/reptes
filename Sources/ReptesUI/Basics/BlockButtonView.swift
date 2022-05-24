//
//  BlockButtonView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

struct BlockButtonView: BlockView {
    var block: Block
    
    static func canRender(block: Block) -> Bool {
        block is BlockButton
    }
    
    var body: some View {
        if let blockButton = block as? BlockButton {
            Button {
                //onButton?(block.action, block.paramValue)
            } label: {
                VStack {
                    HStack {
                        Spacer()
                        Text(verbatim: blockButton.localizedText.text)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                }
                .accentColor(blockButton.foregroundColor?.color ?? Color.white)
                .background(blockButton.backgroundColor?.color ?? Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }

        }
    }
}
