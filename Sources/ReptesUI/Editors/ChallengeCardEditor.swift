//
//  ChallengeCardEditor.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/26/22.
//

import Reptes
import SwiftUI

extension Label where Title == Text, Icon == Image {
    init(_ titleKey: LocalizedStringKey, bundleImage name: String, bundle: Bundle) {
        self.init {
            Text(titleKey)
        } icon: {
            Image(name, bundle: bundle)
        }
    }
}

public struct ChallengeCardEditor: View {
    @Binding public var card: ChallengeCard

    public init(card: Binding<ChallengeCard>) {
        self._card = card
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            HStack {
                Group(reversed: card.imageStyle == .textLast) {
                    Text("Text")
                    Text("Image")
                }
            }

            Menu {
                Button(role: .none) {
                } label: {
                    Label("Edit text", systemImage: "pencil")
                }
                
                Picker("", selection: $card.imageStyle) {
                    Label("Text first", bundleImage: "text.person.rectangle", bundle: .module)
                        .tag(ChallengeCard.Style.textFirst)
                    Label("Text last", systemImage: "person.text.rectangle")
                        .tag(ChallengeCard.Style.textLast)
                }
            } label: {
                Label("Details", systemImage: "line.3.horizontal")
            }
        }
    }
}

struct DynChallengeCardEditor: View {
    @State var card: ChallengeCard = .init(id: UUID())
    
    var body: some View {
        ChallengeCardEditor(card: $card)
    }
}

struct ChallengeCardEditor_Previews: PreviewProvider {
    static var previews: some View {
        DynChallengeCardEditor()
            .padding()
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
