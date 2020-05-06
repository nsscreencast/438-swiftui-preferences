//
//  ContentView.swift
//  SwiftUI-Preferences
//
//  Created by Ben Scheirman on 5/5/20.
//  Copyright © 2020 Fickle Bits, LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Label(message: "Hello there")
    }
}

struct Label: View {
    @State var message: String
    @State
    private var size: CGSize?

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: self.size?.width, height: self.size?.width)
            .overlay(
                Text(message)
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .overlay(GeometryReader { geometry in
                    Color.clear
                        .preference(
                            key: LabelSizePreference.self,
                            value: geometry.size)
                })
            )
            .onPreferenceChange(LabelSizePreference.self, perform: { size in
                self.size = size
            })
    }
}

struct LabelSizePreference: PreferenceKey {
    static var defaultValue: CGSize?

    static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
