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
    @GestureState private var dragState = DragState.inactive
    @State private var viewState = CGSize.zero
    
    var body: some View {
        
        let dragGesture = DragGesture(coordinateSpace:.global)
            .updating($dragState) { (value, state,
                _) in
                state = .dragging(translation: value.translation)
            }
            .onEnded { (value) in
                self.viewState.width += value.translation.width
                self.viewState.height += value.translation.height
            }
        
        
        return VStack {
            Text(title)
                .bold()
            GeometryReader { geometry in
                return ZStack {
                    Rectangle()
                        .fill(Color("backgroundColor"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(12.0)
                    Circle()
                        .fill(Color("circleColor"))
                        .frame(width: 48.0, height: 48.0, alignment: .center)
                        .offset(
                            x: self.viewState.width + self.dragState.translation.width,
                            y: self.viewState.height + self.dragState.translation.height
                    )
                        .gesture(dragGesture)
                }
            }
            
            HStack {
                Text("Sharpness: \(sharpness), Intensity: \(intensity)")
                    .font(.caption)
            }
        }
            .padding()
    }
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation : CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
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
