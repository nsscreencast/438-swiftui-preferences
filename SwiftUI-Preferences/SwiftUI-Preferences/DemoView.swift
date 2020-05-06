//
//  DemoView.swift
//  SwiftUI-Preferences
//
//  Created by Ben Scheirman on 5/5/20.
//  Copyright © 2020 Fickle Bits, LLC. All rights reserved.
//

import SwiftUI


struct Parent: View {
    var body: some View {
        Child(color: .red)
    }
}

struct Child: View {
    @State var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(self.color)
            .frame(width: 80, height: 80)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Parent()
    }
}
