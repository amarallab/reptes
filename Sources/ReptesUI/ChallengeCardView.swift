//
//  ChallengeCardView.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import MarkdownUI
import Reptes
import SwiftUI

extension Theme {
    static func basicWith(foregroundColor: Color? = nil) -> Theme {
        var current = Theme.basic
        if let foregroundColor {
            current = current.text {
                ForegroundColor(foregroundColor)
            }
        }
        return current
    }
}

public struct ChallengeCardView: View {
    var card: ChallengeCard
    var mapWidth: CGFloat
    
    public init(card: ChallengeCard, mapWidth: CGFloat) {
        self.card = card
        self.mapWidth = mapWidth
    }

    public var body: some View {
        VStack {
            HStack {
                Group(reversed: card.imageStyle == .textLast) {
                    VStack(alignment: .leading) {
                        HStack {
                            Markdown(card.localizedTitle.text)
                                .markdownTheme(.basicWith(foregroundColor: card.foregroundColor?.color))
                                .id(card.localizedTitle.text)
                            Spacer()
                        }
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
        .background(card.backgroundColor?.color ?? Color.accentColor)
        .cornerRadius(8.0)
        .contentShape(Rectangle())
    }
}

struct ChallengeCardView_Previews: PreviewProvider {
    struct Combined: View {
        @State var count = 1
        
        var body: some View {
            NavigationView {
                List {
                    ChallengeCardView(card: .previewTextFirst, mapWidth: 150)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    
                    Button {
                        count += 1
                    } label: {
                        ChallengeCardView(card: .previewTextLast, mapWidth: 150)
                    }
                    .buttonStyle(.borderless)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Challenges")
            }
            .navigationViewStyle(.stack)
        }
    }
    
    static var previews: some View {
        Combined()
    }
}
