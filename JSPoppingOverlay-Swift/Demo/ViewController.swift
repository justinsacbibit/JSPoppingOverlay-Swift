//
//  ViewController.swift
//  JSPoppingOverlay-Swift
//
//  Created by Justin Sacbibit on 2014-08-24.
//  Copyright (c) 2014 Justin Sacbibit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var successView: UIView?
    var errorView: UIView?
    var customView: UIView?
    var roundView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var frame = CGRect(x: 15, y: 30, width: 120, height: CGRectGetHeight(self.view.bounds) / 5)
        var successView = UIView()
        successView.frame = frame
        successView.backgroundColor = UIColor.greenColor()
        successView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "successTapped"))
        self.view.addSubview(successView)
        self.successView = successView
        
        frame.origin.x = CGRectGetMaxX(successView.frame) + CGRectGetMinX(successView.frame)
        var errorView = UIView()
        errorView.frame = frame
        errorView.backgroundColor = UIColor.redColor()
        errorView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "errorTapped"))
        self.view.addSubview(errorView)
        self.errorView = errorView
        
        frame.origin.x = 30
        frame.origin.y = CGRectGetMaxY(frame) + 15
        frame.size.width = CGRectGetWidth(self.view.bounds) - 60
        frame.size.height += 20
        var customView = UIView()
        customView.frame = frame
        customView.backgroundColor = UIColor.blueColor()
        customView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "customTapped"))
        self.view.addSubview(customView)
        self.customView = customView
        
        frame.origin.x = 100
        frame.origin.y = CGRectGetMaxY(frame) + 10
        frame.size.width = CGRectGetWidth(self.view.bounds) / 3.0
        frame.size.height = CGRectGetWidth(frame)
        var roundView = UIView()
        roundView.frame = frame
        roundView.backgroundColor = UIColor.lightGrayColor()
        roundView.layer.cornerRadius = CGRectGetWidth(roundView.bounds) / 2.0
        roundView.layer.masksToBounds = true
        roundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "roundTapped"))
        self.view.addSubview(roundView)
        self.roundView = roundView
    }
    
    func successTapped() {
        self.successView?.showSuccessPoppingOverlay(message: "Success!")
    }
    
    func errorTapped() {
        self.errorView?.showErrorPoppingOverlay(message: "Error!")
    }
    
    func customTapped() {
        self.customView?.showPoppingOverlay(image: UIImage(named: "SHIP"), withMessage: "SHIP IT!")
    }
    
    func roundTapped () {
        self.roundView?.showSuccessPoppingOverlay(message: "Round!")
    }
}

