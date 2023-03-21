//
//  SwiftUIView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 20/3/23.
//

import SwiftUI

struct CircularProgressView: View {
    var value: CGFloat
    var total: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.accentColor)
            
            Circle()
                .rotation(.degrees(-90))
                .trim(from: 0.0, to: value/total)
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.accentColor)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(value: 20, total: 100)
            .padding()
            .previewLayout(.fixed(width: 200, height: 120))
    }
}
