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

public extension ChallengeView {
    func onButtonAction(_ event: @escaping (BlockButton) -> Void) -> ChallengeView {
        let feedback = BlockButtonFeedback(event)
        return .init(challenge: challenge, actions: actions + [feedback], selection: selection)
    }
}

struct BlockButtonView: BlockView {
    var block: Block
    var actions: [Action]
    
    init(block: Block, actions: [Action]) {
        self.block = block
        self.actions = actions
    }
    
    static func canRender(block: Block) -> Bool {
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
