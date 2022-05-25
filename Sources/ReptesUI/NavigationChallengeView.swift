//
//  NavigationChallengeView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/25/22.
//

import Reptes
import SwiftUI

public struct NavigationChallengeView: View {
    public var title: LocalizedStringKey
    public var challengeViewBuilder: () -> ChallengeView
    public var close: (() -> Void)? = nil

    public init(title: LocalizedStringKey, challengeViewBuilder: @escaping () -> ChallengeView, close: (() -> Void)? = nil) {
        self.title = title
        self.challengeViewBuilder = challengeViewBuilder
        self.close = close
    }
    
    public var body: some View {
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
