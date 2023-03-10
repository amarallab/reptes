//
//  MissingBlockView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

public struct MissingBlockView: BlockView {
    public init(block: any Block, actions: [Action]) {
    }
    
    public static func canRender(block: any Block) -> Bool {
        false
    }

    public var body: some View {
        HStack {
            Spacer()
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .foregroundColor(.red)
            Spacer()
        }
        .padding()
        .background(Color.secondarySystemGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
