//
//  JSPoppingOverlay.swift
//  JSPoppingOverlay-Swift
//
//  Created by Justin Sacbibit on 2014-08-24.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

import UIKit

class JSPoppingOverlay: UIView {
    private var isPopping = false
    
    private var containerView: UIView
    private var backgroundOverlayView: UIView
    private var poppingImageView: UIImageView
    private var textLabel: UILabel
    
    private var _backgroundOverlayAlpha: CGFloat
    
    var backgroundOverlayColor: UIColor {
        get {
            return self.backgroundOverlayView.backgroundColor!
        }
        set(backgroundOverlayColor) {
            self.backgroundOverlayView.backgroundColor = backgroundOverlayColor
        }
    }
    
    var backgroundOverlayAlpha: CGFloat {
        get {
            return self._backgroundOverlayAlpha
        }
        set(backgroundOverlayAlpha) {
            self._backgroundOverlayAlpha = backgroundOverlayAlpha
            self.backgroundOverlayView.alpha = backgroundOverlayAlpha
        }
    }
    
    var textColor: UIColor {
        get {
            return self.textLabel.textColor
        }
        set(textColor) {
            self.textLabel.textColor = textColor
        }
    }
    
    var font: UIFont {
        get {
            return self.textLabel.font
        }
        set(font) {
            self.textLabel.font = font
        }
    }
    
    var successImage: UIImage?
    var errorImage: UIImage?
    
    var customImage: UIImage?
    
    var animationDuration: NSTimeInterval = 0.2
    var duration: NSTimeInterval = 0.5
    
    override init() {
        self.backgroundOverlayView = UIView()
        self.backgroundOverlayView.backgroundColor = UIColor.blackColor()
        self._backgroundOverlayAlpha = 0.75
        self.backgroundOverlayView.alpha = self._backgroundOverlayAlpha
        
        self.containerView = UIView()
        
        self.poppingImageView = UIImageView()
        self.poppingImageView.contentMode = UIViewContentMode.Center
        self.poppingImageView.backgroundColor = UIColor.clearColor()
        
        self.textLabel = UILabel()
        self.textLabel.textColor = UIColor.whiteColor()
        self.textLabel.textAlignment = NSTextAlignment.Center
        self.textLabel.numberOfLines = 1
        self.textLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        
        self.successImage = UIImage(named: "success")
        self.errorImage = UIImage(named: "error")
        
        super.init(frame: frame)
        
        self.addSubview(self.backgroundOverlayView)
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.poppingImageView)
        self.containerView.addSubview(self.textLabel)
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    func isVisible() -> Bool {
        return self.isPopping
    }
    
    func showOverlay(#image: UIImage?, onView view: UIView, withMessage message: NSString?) {
        if (image == nil && message == nil) {
            fatalError("Attempt to be shown without content")
        }
        
        if (self.isPopping) {
            return;
        }
        
        self.isPopping = true
        
        self.frame = view.bounds
        
        var frame = CGRect()
        frame.origin.x = 0.0
        frame.origin.y = 0.0
        frame.size.width = CGRectGetWidth(self.bounds)
        frame.size.height = CGRectGetHeight(self.bounds)
        self.backgroundOverlayView.frame = frame
        
        if image != nil {
            self.poppingImageView.image = image
            frame.size.height = self.poppingImageView.image.size.height
        } else {
            frame.size.height = 0.0
        }
        self.poppingImageView.frame = frame
        var scale: CGFloat = 1.8
        self.poppingImageView.transform = CGAffineTransformMakeScale(scale, scale)
        
        var topPadding: CGFloat = (message != nil && image != nil) ? 10.0 : 0.0
        frame.origin.y = CGRectGetMaxY(frame) + topPadding
        if let unwrappedMessage = message? {
            frame.size.height = unwrappedMessage.sizeWithAttributes([NSFontAttributeName: self.font]).height
            self.textLabel.frame = frame
            self.textLabel.text = message
        } else {
            self.textLabel.frame = CGRectZero
        }
        
        frame.size.height = CGRectGetHeight(self.poppingImageView.bounds) + topPadding + CGRectGetHeight(self.textLabel.bounds)
        frame.origin.y = (CGRectGetHeight(self.bounds) - frame.size.height) / 2.0
        self.containerView.frame = frame
        
        view.addSubview(self)
        
        UIView.animateWithDuration(self.animationDuration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.poppingImageView.transform = CGAffineTransformIdentity
        }) { (finished) -> Void in
            UIView.animateWithDuration(self.animationDuration, delay: self.duration, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.backgroundOverlayView.alpha = 0.0
                self.poppingImageView.alpha = 0.0
                self.poppingImageView.transform = CGAffineTransformMakeScale(0.2, 0.2)
                frame.origin.y = CGRectGetMaxY(self.bounds)
                self.textLabel.frame = frame
                self.textLabel.alpha = 0.0
                }, completion: { (finished) -> Void in
                    self.removeFromSuperview()
                    self.reset()
            })
        }
    }
    
    func showCustomImage(onView view: UIView, withMessage message: NSString?) {
        self.showOverlay(image: self.customImage, onView: view, withMessage: message)
    }
    
    func showSuccess(onView view: UIView, withMessage message: NSString?) {
        self.showOverlay(image: self.successImage, onView: view, withMessage: message)
    }
    
    func showError(onView view: UIView, withMessage message: NSString?) {
        self.showOverlay(image: self.errorImage, onView: view, withMessage: message)
    }
    
    func hideImmediately() {
        self.removeFromSuperview()
    }
    
    private func reset() {
        self.backgroundOverlayView.alpha = self.backgroundOverlayAlpha
        self.poppingImageView.alpha = 1.0
        self.poppingImageView.transform = CGAffineTransformIdentity
        self.textLabel.alpha = 1.0
        self.isPopping = true
    }
}
