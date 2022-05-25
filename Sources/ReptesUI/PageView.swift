//
//  PageView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Reptes
import SwiftUI

struct PageView<BV: BlockView>: View {
    var page: Page
    var actions: [Action]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                HStack {
                    Spacer()
                    VStack(spacing: 20) {
                        ForEach(page.blocks, id: \.id) { block in
                            BV(block: block, actions: actions)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView<BasicBlockView>(page: .preview, actions: [])
    }
}
