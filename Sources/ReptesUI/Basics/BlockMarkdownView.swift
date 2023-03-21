//
//  BlockMarkdownView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Combine
import MarkdownUI
import Reptes
import SwiftUI

enum RevealStatus: Equatable {
    case hidden
    case waiting(until: Date)
    case unveilable
    case unveiled
}

struct BlockMarkdownView: BlockView {
    @Environment(\.locale) var locale
    var block: any Block
    @State var status = RevealStatus.hidden
    @State var timer: Publishers.Autoconnect<Timer.TimerPublisher>?
    @State var elapsedPercentage: CGFloat = 0.0
    var unveil: BlockMarkdownUnveil
    
    init(block: any Block, actions: [Action]) {
        self.block = block
        
        if let blockMarkdown = block as? BlockMarkdown,
           let unveil = blockMarkdown.unveil
        {
            _status = State(initialValue: .hidden)
            self.unveil = unveil
        } else {
            _status = State(initialValue: .unveiled)
            self.unveil = .init(unveilText: .init(values: [:]), waitingTime: 1.0)
        }
    }
    
    static func canRender(block: any Block) -> Bool {
        block is BlockMarkdown
    }
    
    var body: some View {
        if let blockMarkdown = block as? BlockMarkdown {
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Markdown(blockMarkdown.localizedText.text(for: locale))
                            .id(blockMarkdown.localizedText.text(for: locale))
                        Spacer()
                    }
                    if blockMarkdown.underlined ?? false {
                        Divider()
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, (blockMarkdown.backgroundTransparent ?? false) ? CGFloat(0.0) : nil)
                .background((blockMarkdown.backgroundTransparent ?? false) ? Color.clear :  Color.secondarySystemGroupedBackground)
                .blur(radius: status == .unveiled ? 0 : 8)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                switch status {
                case .hidden:
                    EmptyView()
                case .waiting(until: let untilDate):
                    CircularProgressView(value: elapsedPercentage)
                        .frame(width: 32, height: 32)
                        .progressViewStyle(.circular)
                    if let timer {
                        EmptyView()
                            .onReceive(timer) { _ in
                                let elapsedPercentage = 1.0 - untilDate.timeIntervalSinceNow / unveil.waitingTime
                                withAnimation {
                                    if elapsedPercentage >= 1.0 {
                                        status = .unveilable
                                    } else {
                                        self.elapsedPercentage = elapsedPercentage
                                    }
                                }
                            }
                    }
                case .unveilable:
                    Button {
                        withAnimation {
                            status = .unveiled
                        }
                    } label: {
                        Text(unveil.unveilText.text(for: locale))
                    }
                    .buttonStyle(.borderedProminent)
                case .unveiled:
                    EmptyView()
                }
            }
            .onAppear {
                switch status {
                case .hidden:
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    status = .waiting(until: Date().addingTimeInterval(unveil.waitingTime))
                    elapsedPercentage = 0.0
                default:
                    break
                }
            }
            .onDisappear {
                timer = nil
                switch status {
                case .waiting:
                    status = .hidden
                default:
                    break
                }
            }
        }
    }
}

struct BlockMarkdownView_Previews: PreviewProvider {
    static let firstID = UUID()
    static let secondID = UUID()
    
    static var challenge = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: firstID, localizedText: .init(values: [
                        "en": "First page",
                        "es": "Primera página"
                    ])),
                    BlockMarkdown(
                        id: secondID,
                        localizedText: .init(values: [
                            "en": "Second page",
                            "es": "Segunda página"
                            ]),
                        unveil: .init(
                            unveilText: .init(values: [
                                "en": "Unveil",
                                "es": "Desvelar"
                            ]),
                            waitingTime: 10))
                ]
            )
        ])
    
    static var previews: some View {
        ChallengeView(challenge: challenge)
            .environment(\.locale, Locale(identifier: "en"))
        ChallengeView(challenge: challenge)
            .environment(\.locale, Locale(identifier: "es"))
    }
}
