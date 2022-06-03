//
//  SwiftUIView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import Reptes
import SwiftUI

extension Page {
    public static let preview = Page(
        id: UUID(),
        title: "page",
        blocks: [
        ])
}

extension Array where Element == Page {
    public static let preview: [Page] = (1...5).map { pageId in
        Page(
            id: UUID(),
            title: "Page \(pageId)",
            blocks: .preview)
    }
}
