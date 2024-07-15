//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import Foundation
import Reptes

#if os(iOS)
import UIKit
#endif

extension ChallengeCard {
    public static var forestMushroomImage: KYImage? {
        #if os(iOS)
        return UIImage(named: "ForestMushroom", in: Bundle.module, with: nil)
        #elseif os(macOS)
        return Bundle.module.image(forResource: "ForestMushroom")
        #endif
    }
    
    public static let previewTextFirst = ChallengeCard(
        id: UUID(),
        backgroundColor: .init(color: .green),
        foregroundColor: .init(color: .white),
        image: forestMushroomImage,
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
        image: forestMushroomImage,
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
