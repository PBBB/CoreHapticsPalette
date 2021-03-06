//
//  ContentView.swift
//  Palette
//
//  Created by Issac Penn on 2019/7/1.
//  Copyright © 2019 Issac Penn. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            SinglePaletteView(title: "Continuous")
            SinglePaletteView(title: "Transient")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().colorScheme(.dark)
        }
    }
}
#endif
