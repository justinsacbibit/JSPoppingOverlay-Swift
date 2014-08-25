JSPoppingOverlay-Swift
======================

Class for displaying quick event feedback on top of a UIView, written in Swift.

![GIF](http://i.imgur.com/nPsKxk8.gif)

Installation
-

###Manually

- Drag the `JSPoppingOverlay-Swift/JSPoppingOverlay` folder into your project.

###Cocoapods

- There is currently no support for Cocoapods. If you really want it, please make a feature request by creating an issue with the `feature request` label.

Usage
-

You can see the sample app in `JSPoppingOverlay-Swift/Demo/`

#####Important: Success/error images are not included in the `JSPoppingOverlay` folder.

You can use the provided JSPoppingOverlay category on UIView:
```swift
self.viewToShowOverlayOn.showSuccessPoppingOverlay(message: "Success!")
```

Or you can create and customize a JSPoppingOverlay object:
```swift
var poppingOverlay = JSPoppingOverlay();

// customization
poppingOverlay.animationDuration = myAnimationDuration;
poppingOverlay.font = myFont;

poppingOverlay.showSuccess(onView: viewToShowOverlayOn, withMessage:mySuccessMessage)
```

Customization
- 

There are multiple properties you can access to customize the appearance of the popping overlay:
```swift
var backgroundOverlayColor: UIColor
var backgroundOverlayAlpha: CGFloat
var textColor: UIColor
var font: UIFont
var successImage: UIImage
var errorImage: UIImage
var customImage: UIImage
var animationDuration: NSTimeInterval
var duration: NSTimeInterval
```

Issues/Contributions
-

Feel free to submit an issue or a pull request!
