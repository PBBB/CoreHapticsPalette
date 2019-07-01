//
//  SinglePaletteView.swift
//  Palette
//
//  Created by Issac Penn on 2019/7/1.
//  Copyright © 2019 Issac Penn. All rights reserved.
//

import SwiftUI

struct SinglePaletteView : View {
    var title = "Title"
    @State var sharpness = 0.50
    @State var intensity = 0.50
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
            ZStack {
                Rectangle()
                    .fill(Color("backgroundColor"))
                    .aspectRatio(1.0, contentMode: .fit)
                    .cornerRadius(12.0)
                Circle()
                    .fill(Color("circleColor"))
                    .frame(width: 48.0, height: 48.0, alignment: .center)
            }
            HStack {
                Text("Sharpness: \(sharpness), Intensity: \(intensity)")
                    .font(.caption)
            }
        }
            .padding()
    }
}

#if DEBUG
struct SinglePaletteView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            SinglePaletteView().previewLayout(.sizeThatFits)
            SinglePaletteView().previewLayout(.sizeThatFits).colorScheme(.dark)
        }
        
    }
}
#endif
