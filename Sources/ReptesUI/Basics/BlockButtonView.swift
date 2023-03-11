//
//  BlockButtonView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct BlockButtonFeedback: Action {
    fileprivate var event: (BlockButton) -> Void
    
    public init(_ event: @escaping (BlockButton) -> Void) {
        self.event = event
    }
}

public extension BaseChallengeView {
    func onButtonAction(_ event: @escaping (BlockButton) -> Void) -> Self {
        self.addAction(BlockButtonFeedback(event))
    }
}

struct BlockButtonView: BlockView {
    var block: any Block
    var actions: [Action]
    
    init(block: any Block, actions: [Action]) {
        self.block = block
        self.actions = actions
    }
    
    static func canRender(block: any Block) -> Bool {
        block is BlockButton
    }

    var body: some View {
        if let blockButton = block as? BlockButton {
            Button {
                actions.compactMap { $0 as? BlockButtonFeedback }.forEach { $0.event(blockButton) }
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
