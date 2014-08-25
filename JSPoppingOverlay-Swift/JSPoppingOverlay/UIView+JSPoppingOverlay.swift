//
//  UIView+JSPoppingOverlay.swift
//  JSPoppingOverlay-Swift
//
//  Created by Justin Sacbibit on 2014-08-24.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

import UIKit

extension UIView {
    private func hasOverlay() -> Bool {
        for subview in self.subviews {
            if subview.isKindOfClass(JSPoppingOverlay.classForCoder()) {
                return true
            }
        }
        return false
    }
    
    private func overlay() -> JSPoppingOverlay? {
        if self.hasOverlay() {
            return nil
        }
        return JSPoppingOverlay()
    }
    
    func showSuccessPoppingOverlay(#message: NSString?) {
        self.overlay()?.showSuccess(onView: self, withMessage: message)
    }
    
    func showErrorPoppingOverlay(#message: NSString?) {
        self.overlay()?.showError(onView: self, withMessage: message)
    }
    
    func showPoppingOverlay(#image: UIImage?, withMessage message: NSString?) {
        self.overlay()?.showOverlay(image: image, onView: self, withMessage: message)
    }
}
