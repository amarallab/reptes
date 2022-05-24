//
//  BaseChallengeView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import SwiftUI
import Reptes

public struct BaseChallengeView<BV: BlockView>: View {
    public var challenge: Challenge
    @State public var selection: UUID = UUID()
    public var close: (() -> Void)?
    
    public init(challenge: Challenge, selection: UUID = UUID(), close: (() -> Void)? = nil) {
        self.challenge = challenge
        self.selection = selection
        self.close = close
    }
    
    public var body: some View {
        TabView(selection: $selection) {
            ForEach(challenge.pages) { page in
                PageView<BV>(page: page)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear { selection = challenge.pages.first?.id ?? UUID() }
        .background(Color.systemGroupedBackground.ignoresSafeArea())
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

extension BaseChallengeView {
    @ViewBuilder
    public func register<BV1: BlockView>(_ bv1: BV1.Type) -> BaseChallengeView<CompositeBlockView<BV, BV1>> {
        BaseChallengeView<CompositeBlockView<BV, BV1>>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                BV2
            >>
    {
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                BV2
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                CompositeBlockView<BV2, BV3>
            >>
    {
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<BV, BV1>,
                CompositeBlockView<BV2, BV3>
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    BV2
                >,
                CompositeBlockView<BV3, BV4>
            >>
    {
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    BV2
                >,
                CompositeBlockView<BV3, BV4>
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<BV4, BV5>
            >>
    {
        BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<BV4, BV5>
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView, BV6: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type, _ bv6: BV6.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<
                    CompositeBlockView<BV4, BV5>,
                    BV6
                >
            >>
    {
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
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
    
    @ViewBuilder
    public func register<BV1: BlockView, BV2: BlockView, BV3: BlockView, BV4: BlockView, BV5: BlockView, BV6: BlockView, BV7: BlockView>(_ bv1: BV1.Type, _ bv2: BV2.Type, _ bv3: BV3.Type, _ bv4: BV4.Type, _ bv5: BV5.Type, _ bv6: BV6.Type, _ bv7: BV7.Type)
        -> BaseChallengeView<
            CompositeBlockView<
                CompositeBlockView<
                    CompositeBlockView<BV, BV1>,
                    CompositeBlockView<BV2, BV3>
                >,
                CompositeBlockView<
                    CompositeBlockView<BV4, BV5>,
                    CompositeBlockView<BV6, BV7>
                >
            >>
    {
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
            >>(
            challenge: challenge,
            selection: selection,
            close: close)
    }
}

public typealias ChallengeView = BaseChallengeView<BasicBlockView>

struct ChallegeView_Previews: PreviewProvider {
    struct BlockMissing: Block, Codable, Equatable {
        public var id: UUID
    }
    
    static var missingBlockChallenge = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMissing(id: UUID()),
                    BlockImage.preview
                ]
            )
        ])

    static var previews: some View {
        ChallengeView(challenge: .preview)
        ChallengeView(challenge: missingBlockChallenge)
    }
}
