//
//  ChallengeEditor.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/26/22.
//

import Reptes
import SwiftUI

struct ChallengeEditor: View {
    @Binding public var challenge: Challenge

    var body: some View {
        Image("text.person.rectangle", bundle: .module)
    }
}

struct ChallengeEditor_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeEditor(challenge: .constant(.preview))
    }
}
