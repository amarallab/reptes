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

fileprivate struct SheetChallengeView: View {
    @State var showing: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                showing = true
            } label: {
                Label("Show", systemImage: "eye")
            }
            Spacer()
        }
        .sheet(isPresented: $showing) {
            NavigationView {
                ChallengeView(challenge: .multipagePreview)
                    .onButtonAction {
                        if $0.action == .close {
                            showing = false
                        }
                    }
                    .navigationBarTitle("test", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Close") {
                                showing = false
                            }
                        }
                    }
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        DynChallengeView()
        ChallengeView(challenge: .missingBlockPreview)
        ChallengeView(challenge: .multipagePreview)
        SheetChallengeView()
    }
}
