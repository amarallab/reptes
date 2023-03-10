//
//  NavigationChallengeView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/25/22.
//

import Reptes
import SwiftUI

public struct NavigationChallengeView<BV: BlockView>: View {
    public var title: LocalizedStringKey
    public var challengeViewBuilder: () -> BaseChallengeView<BV>
    public var close: (() -> Void)? = nil

    public init(title: LocalizedStringKey, challengeViewBuilder: @escaping () -> BaseChallengeView<BV>, close: (() -> Void)? = nil) {
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

fileprivate struct MyBlock: Block, Codable, Equatable {
    var id: UUID
    var text: String
}

fileprivate struct MyBlockView: BlockView {
    var block: any Block
    var actions: [Action]

    static func canRender(block: any Block) -> Bool {
        block is MyBlock
    }
    
    var body: some View {
        if let myBlock = block as? MyBlock {
            HStack {
                Spacer()
                Text("This is a MyBlock ") + Text(myBlock.text)
                Spacer()
            }
            .padding()
            .background(Color.secondarySystemGroupedBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
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
            NavigationChallengeView(title: "Sheet example") {
                ChallengeView(challenge: .multipagePreview)
                    .register(MyBlockView.self)
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
