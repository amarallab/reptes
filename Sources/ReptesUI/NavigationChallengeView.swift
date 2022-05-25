//
//  NavigationChallengeView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/25/22.
//

import Reptes
import SwiftUI

struct NavigationChallengeView: View {
    var title: LocalizedStringKey
    var challengeViewBuilder: () -> ChallengeView
    var actions: [Action] = []
    var close: (() -> Void)? = nil

    var body: some View {
        NavigationView {
            challengeViewBuilder()
                .onButtonAction {
                    if $0.action == .close {
                        close?()
                    }
                }
                .navigationBarTitle(title, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Close") {
                            close?()
                        }
                    }
                }
        }
        .navigationViewStyle(.stack)
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
            NavigationChallengeView(title: "Sheet example") {
                ChallengeView(challenge: .multipagePreview)
            } close: {
                showing = false
            }
        }
    }
}

struct NavigationChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        SheetChallengeView()
    }
}
