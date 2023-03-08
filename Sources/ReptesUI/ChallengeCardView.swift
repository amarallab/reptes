//
//  ChallengeCardView.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import MarkdownUI
import Reptes
import SwiftUI

public struct ChallengeCardView: View {
    var card: ChallengeCard
    var mapWidth: CGFloat
    var onTap: () -> Void
    
    public init(card: ChallengeCard, mapWidth: CGFloat, onTap: @escaping () -> Void) {
        self.card = card
        self.mapWidth = mapWidth
        self.onTap = onTap
    }

    public var body: some View {
        VStack {
            HStack {
                Group(reversed: card.imageStyle == .textLast) {
                    VStack(alignment: .leading) {
                        Markdown(card.localizedTitle.text)
                            .foregroundColor(card.foregroundColor?.color ?? Color.white)
                            .id(card.localizedTitle.text)
                        Spacer()
                    }
                    .padding()

                    Spacer()
                    
                    if let uiImage = card.image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: mapWidth, maxWidth: mapWidth, minHeight: mapWidth)
                            .clipped()
                            .accessibilityHidden(true)
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(card.foregroundColor?.color)
        .background(card.backgroundColor?.color ?? Color.accentColor)
        .cornerRadius(8.0)
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
        .accessibilityAddTraits(.isButton)
    }
}

struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            List {
                ChallengeCardView(card: .previewTextFirst, mapWidth: proxy.size.width * 0.3) {
                }
                ChallengeCardView(card: .previewTextLast, mapWidth: proxy.size.width * 0.3) {
                }
            }
            .listStyle(.sidebar)
        }
    }
}
