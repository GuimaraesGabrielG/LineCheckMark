# LineCheckMark

<table id='pictures'>
<td >
<img src="https://user-images.githubusercontent.com/47581150/107129616-6054e100-68a5-11eb-9825-7f864dda87c9.gif" alt="Kapture 2021-02-06 at 17 57 56" width="266" height="145,5" />
</td>
<td >
<img src="https://user-images.githubusercontent.com/47581150/107129623-71055700-68a5-11eb-9a60-bdc9e5e5abbb.gif" alt="Kapture 2021-02-06 at 17 46 13" width="266" height="145,5" />
</td>
<td >
<img src="https://user-images.githubusercontent.com/47581150/107129624-72cf1a80-68a5-11eb-9806-8cd9f2d7b918.gif" alt="Kapture 2021-02-06 at 17 35 07" width="266" height="145,5" />
</td>
</table>


LineCheckMark is a library for rendering a check mark

- **Customizable:** Designed to be used in the best way, you can customize:
  - View size
  - Line size
  - Color / Gradient
  - Animation
  - Box
- **Documented**:  100% documented for user understand each method and attributes .

## Install

#### Swift Package Manager

Add `https://github.com/GuimaraesGabrielG/LineCheckMark.git` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).



## Example - Gradient

```swift
 let lineCheckMark = LineCheckMark(frame: CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 100, height: 100))
        
lineCheckMark.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)
lineCheckMark.sizeLine = 10
lineCheckMark.durationAnimation = 3
lineCheckMark.isAnimation = true
lineCheckMark.setColorsGradient(colors: [UIColor.red.withAlphaComponent(0.1), UIColor.red]) 
// or lineCheckMark.lineBackgroundColor = .cyan


self.view.addSubview(lineCheckMark)
```



## Example - With Box

```swift
 let lineCheckMark = LineCheckMark(frame: CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 100, height: 100))
        
lineCheckMark.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)
lineCheckMark.sizeLine = 10
lineCheckMark.durationAnimation = 3
lineCheckMark.isAnimation = true
lineCheckMark.layer.borderWidth = 2
lineCheckMark.layer.borderColor = UIColor.black.cgColor
lineCheckMark.setColorsGradient(colors: [UIColor.cyan, UIColor.blue])

self.view.addSubview(lineCheckMark)
```

## Contact

Drop me an email if you have any  doubt

[Email](0609guimaraes@gmail.com)

## License

MIT License

Copyright (c) 2021 GuimarãesGabrielG

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
