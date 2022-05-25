//
//  BaseChallengeView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import Reptes
import SwiftUI

public struct BaseChallengeView<BV: BlockView>: View {
    public var challenge: Challenge
    public var actions: [Action] = []
    @State public var selection: UUID = UUID()
    
    public init(challenge: Challenge, actions: [Action] = [], selection: UUID = UUID()) {
        self.challenge = challenge
        self.actions = actions
        self.selection = selection
    }
    
    func prevId(of id: UUID) -> UUID? {
        guard
            let firstIndex = challenge.pages.firstIndex(where: { $0.id == id }),
            let prevIndex = challenge.pages.index(firstIndex, offsetBy: -1, limitedBy: challenge.pages.startIndex)
        else {
            return nil
        }
        return challenge.pages[prevIndex].id
    }
    
    func nextId(of id: UUID) -> UUID? {
        guard
            let firstIndex = challenge.pages.firstIndex(where: { $0.id == id }),
            let nextIndex = challenge.pages.index(firstIndex, offsetBy: 1, limitedBy: challenge.pages.endIndex)
        else {
            return nil
        }
        return challenge.pages[nextIndex].id
    }

    var internalActions: [Action] {
        [
            BlockButtonFeedback { button in
                switch button.action {
                case .next:
                    if let id = nextId(of: selection) {
                        withAnimation {
                            selection = id
                        }
                    }
                case .previous:
                    if let id = prevId(of: selection) {
                        withAnimation {
                            selection = id
                        }
                    }
                default:
                    break
                }
            }
        ] + actions
    }
    
    public var body: some View {
        TabView(selection: $selection) {
            ForEach(challenge.pages) { page in
                PageView<BV>(page: page, actions: internalActions)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear { selection = challenge.pages.first?.id ?? UUID() }
        .background(Color.systemGroupedBackground.ignoresSafeArea())
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

extension BaseChallengeView {
    public func register<BV1: BlockView>(_ bv1: BV1.Type) ->
        BaseChallengeView<
            CompositeBlockView<BV, BV1>
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type) ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                BV2
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type) ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                CompositeBlockView<BV2, BV3>
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type) ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    BV2
                >,
                CompositeBlockView<BV3, BV4>
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type)
        ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<BV4, BV5>
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView, BV6: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type, _ bv6: BV6.Type)
        ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<
                    CompositeBlockView<BV4, BV5>,
                    BV6
                >
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
    
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView, BV6: BlockView, BV7: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type, _ bv6: BV6.Type, _ bv7: BV7.Type)
        ->
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<
                    CompositeBlockView<BV4, BV5>,
                    CompositeBlockView<BV6, BV7>
                >
            >
        >
    {
        .init(challenge: challenge, actions: actions, selection: selection)
    }
}

struct BaseChallegeView_Previews: PreviewProvider {
    static var previews: some View {
        BaseChallengeView<BasicBlockView>(challenge: .preview)
        BaseChallengeView<BasicBlockView>(challenge: .missingBlockPreview)
    }
}
