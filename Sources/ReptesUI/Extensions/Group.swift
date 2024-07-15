//
//  SwiftUIView.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/27/22.
//

import SwiftUI

@ViewBuilder
public func Group<C0, C1>(reversed: Bool, @ViewBuilder for content: () -> TupleView<(C0, C1)>) -> some View {
    let contentResult = content()
    if !reversed {
        contentResult
    } else {
        let (c0, c1) = contentResult.value
        TupleView((c1, c0))
    }
}

@ViewBuilder
public func Group<C0, C1, C2>(reversed: Bool, @ViewBuilder for content: () -> TupleView<(C0, C1, C2)>) -> some View {
    let contentResult = content()
    if !reversed {
        contentResult
    } else {
        let (c0, c1, c2) = contentResult.value
        TupleView((c2, c1, c0))
    }
}

@ViewBuilder
public func Group<C0, C1, C2, C3>(reversed: Bool, @ViewBuilder for content: () -> TupleView<(C0, C1, C2, C3)>) -> some View {
    let contentResult = content()
    if !reversed {
        contentResult
    } else {
        let (c0, c1, c2, c3) = contentResult.value
        TupleView((c3, c2, c1, c0))
    }
}

fileprivate struct GroupExampleView: View {
    @State var reversed = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Group(reversed: reversed) {
                            Text("Text")
                            Image(systemName: "eye")
                        }
                    }

                    HStack {
                        Group(reversed: reversed) {
                            Text("Text")
                            Image(systemName: "eye")
                            Spacer()
                        }
                    }

                    HStack {
                        Group(reversed: reversed) {
                            Text("Text")
                            Spacer()
                            Image(systemName: "eye")
                        }
                    }
                }
            }
            .navigationTitle("Example")
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Picker("", selection: $reversed) {
                        Text("Text - Image").tag(false)
                        Text("Image - Text").tag(true)
                    }
                    .pickerStyle(.segmented)
                }
            }
            #endif
        }
    }
}

struct Group_Previews: PreviewProvider {
    static var previews: some View {
        GroupExampleView()
    }
}
