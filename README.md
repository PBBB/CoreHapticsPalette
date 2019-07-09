# Core Haptics Palette
Rebuilds the [sample app](https://developer.apple.com/documentation/corehaptics/updating_continuous_and_transient_haptic_parameters_in_real_time?changes=latest_mino_4) in the [WWDC 2019 Session 223](https://developer.apple.com/videos/play/wwdc2019/223/) using SwiftUI.

<img src="https://docs-assets.developer.apple.com/published/e4ef26ca6c/1b167038-2788-492a-a030-a6a448930923.png" srcset="https://docs-assets.developer.apple.com/published/e4ef26ca6c/1b167038-2788-492a-a030-a6a448930923.png 2x" alt="A screenshot of the HapticPalette interface, showing a labeled circle and the meaning of coordinate axes controlling intensity and sharpness." width="482" height="auto">

## Currently WIP
- [x] Building UI
- [x] Adding drag interaction
- [ ] Adding bounds to the drag interaction
- [ ] Calculating parameters using the position of the circle
- [ ] Adding Core Haptics
- [ ] Dark mode support

## Discussion
I could not figure out how to add bounds to the drag interaction properly. I came up with two options:
1. Save gesture data as @State, and calculate the offset of the circle using the frame data of GeometryReader. However, when the circle is dragged out of the rectangle, though the circle stays inside the rectangle near the edge, the gesture data still includes part of the offset which exceeeds the frame of the rectangle (because the calculation is inside the "body"). When dragging the circle back to the center of the rectangle, the circle doesn't move at all at first.
2. Calculate offset inside gesture's "updating" modifier. But you simply cannot get the frame of the rectangle outside of the "body". And the frame can change dramatically, like when rotating the device or using split screen etc. This means you have to listen to the layout event, which in my opinion doesn't comply with what SwiftUI is all about.

So maybe it's time to pause the project, and learn more about SwiftUI now.
