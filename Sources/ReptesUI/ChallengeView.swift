//
//  ChallengeView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/24/22.
//

import Reptes
import SwiftUI

public typealias ChallengeView = BaseChallengeView<BasicBlockView>

fileprivate struct DynChallengeView: View {
    @State var value: String = "[...]"

    var body: some View {
        VStack(spacing: 20) {
            Text(value)
            ChallengeView(challenge: .preview)
                .onButtonAction {
                    switch $0.action {
                    case .close:
                        value = "Close"
                    default:
                        value = "Receiving: \($0)"
                    }
                }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        DynChallengeView()
        ChallengeView(challenge: .missingBlockPreview)
        ChallengeView(challenge: .multipagePreview)
    }
}
