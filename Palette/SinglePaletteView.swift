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
    @State private var circleRadius : CGFloat = 48.0
    private var tempState = CGSize.zero
    
    var body: some View {
        
        let dragGesture = DragGesture(coordinateSpace:.global)
            .updating($dragState) { (value, state,
                _) in
                state = .dragging(translation: value.translation)
            }
            .onEnded { (value) in
//                self.viewState.width += value.translation.width
//                self.viewState.height += value.translation.height
                self.viewState = self.tempState
        }
        
        
    
        return VStack {
            Text(title)
                .bold()
            GeometryReader { geometryProxy in
                ZStack {
                    Rectangle()
                        .fill(Color("backgroundColor"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(24.0)
                    Circle()
                        .fill(Color("circleColor"))
                        .frame(width: self.circleRadius, height: self.circleRadius, alignment: .center)
                        .offset(self.calculateOffset(geometryProxy: geometryProxy))
                        .gesture(dragGesture)
                }.fixedSize()
            }
            HStack {
                Text("Sharpness: \(sharpness), Intensity: \(intensity)")
                    .font(.caption)
            }
        }
            .padding()
        
        
    }
    
    private func calculateOffset (geometryProxy : GeometryProxy) -> CGSize {
        var offset = CGSize.zero
        if self.viewState.width + self.dragState.translation.width > 0 {
            offset.width = min(self.viewState.width + self.dragState.translation.width, min(geometryProxy.size.width, geometryProxy.size.height)/2 - self.circleRadius/2)
        } else {
            offset.width = max(self.viewState.width + self.dragState.translation.width, self.circleRadius/2 - min(geometryProxy.size.width, geometryProxy.size.height)/2)
        }
        if self.viewState.height + self.dragState.translation.height > 0 {
            offset.height = min(self.viewState.height + self.dragState.translation.height, min(geometryProxy.size.width, geometryProxy.size.height)/2 - self.circleRadius/2)
        } else {
            offset.height = max(self.viewState.height + self.dragState.translation.height, self.circleRadius/2 - min(geometryProxy.size.width, geometryProxy.size.height)/2)
        }
        
//        switch self.dragState {
//        case .dragging(_):
//            self.tempState = offset
//        case .inactive:
//            break
//        }
        
        return offset
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
