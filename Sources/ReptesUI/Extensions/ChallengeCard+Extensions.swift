//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import Foundation
import Reptes
import UIKit

extension ChallengeCard {
    public static let previewTextFirst = ChallengeCard(
        id: UUID(),
        backgroundColor: .init(color: .green),
        foregroundColor: .init(color: .white),
        image: UIImage(named: "ForestMushroom", in: Bundle.module, with: nil),
        imageStyle: .textFirst,
        localizedTitle: .init(values: [
            "en": """
                  ## Title
                  Example text first
                  """,
            "es": """
                  ## Título
                  Ejemplo texto primero
                  """
        ]))

    public static let previewTextLast = ChallengeCard(
        id: UUID(),
        backgroundColor: .init(color: .green),
        foregroundColor: .init(color: .white),
        image: UIImage(named: "ForestMushroom", in: Bundle.module, with: nil),
        imageStyle: .textLast,
        localizedTitle: .init(values: [
            "en": """
                  ## Title
                  Example text last
                  """,
            "es": """
                  ## Título
                  Ejemplo texto último
                  """
        ]))
}
