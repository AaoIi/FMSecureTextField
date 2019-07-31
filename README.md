# FMSecureTextField

## Description
FMSecureTextField provides a friendly way to show or hide password for secure textfield, in either image or text.


## Preview Demo
<img src="https://raw.githubusercontent.com/AaoIi/FMSecureTextField/master/demo.gif">

## Installation

### CocoaPods
[CocoaPods][] is a dependency manager for Cocoa projects. To install FMSecureTextField with CocoaPods:

1. Make sure CocoaPods is [installed][CocoaPods Installation].

2. Update your Podfile to include the following:

``` ruby
use_frameworks!
pod 'FMSecureTextField'
```

3. Run `pod install`.

[CocoaPods]: https://cocoapods.org
[CocoaPods Installation]: https://guides.cocoapods.org/using/getting-started.html#getting-started

4. In your code import FMPhoneTextField like so:
`import FMSecureTextField`

## How to use FMSecureTextField
##### 1) Drag UITextField in Storyboard and from identity inspector change class to : FMSecureTextField <br/>
##### 2.1) Choose textfield and from attribute inspector set show/hide image as UIImage and make sure to enable "secureTypeImage=true"<br/>
##### 2.2) Choose textfield and from attribute inspector set show/hide Text as String and make sure to enable "secureTypeText=true"<br/>
##### 4) We Are All set ;) <br/> 

## Customization

##### To show the secure button .whileEditing or .always:<br/> 
```swift
 public var secureViewShowMode: UITextField.ViewMode = .whileEditing
```

##### Customize the secure button style,font,background:<br/> 
```swift
 public var getSecureButton : UIButton
```

## Requierments ##
* Swift 5+
* IOS 8+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2016

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
