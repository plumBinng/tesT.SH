
//
//  SCLAlertView.swift
//  SCLAlertView Example
//
//  Created by Viktor Radchenko on 6/5/14.
//  Copyright (c) 2014 Viktor Radchenko. All rights reserved.
//

import Foundation
import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


// Pop Up Styles
public enum SCLAlertViewStyle {
    case success, error, notice, warning, info, edit, wait, question
    
    public var defaultColorInt: UInt {
        switch self {
        case .success:
            return 0x22B573
        case .error:
            return 0xC1272D
        case .notice:
            return 0x727375
        case .warning:
            return 0xFFD110
        case .info:
            return 0x2866BF
        case .edit:
            return 0xA429FF
        case .wait:
            return 0xD62DA5
        case .question:
            return 0x727375
        }
        
    }

}

// Animation Styles
public enum SCLAnimationStyle {
    case noAnimation, topToBottom, bottomToTop, leftToRight, rightToLeft
}

// Action Types
public enum SCLActionType {
    case none, selector, closure
}

public enum SCLAlertButtonLayout {
    case horizontal, vertical
}
// Button sub-class
open class SCLButton: UIButton {
    var actionType = SCLActionType.none
    var target:AnyObject!
    var selector:Selector!
    var action:(()->Void)!
    var customBackgroundColor:UIColor?
    var customTextColor:UIColor?
    var initialTitle:String!
    var showTimeout:ShowTimeoutConfiguration?
    
    public struct ShowTimeoutConfiguration {
        let prefix: String
        let suffix: String
        
        public init(prefix: String = "", suffix: String = "") {
            self.prefix = prefix
            self.suffix = suffix
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override public init(frame:CGRect) {
        super.init(frame:frame)
    }
}

// Allow alerts to be closed/renamed in a chainable manner
// Example: SCLAlertView().showSuccess(self, title: "Test", subTitle: "Value").close()
open class SCLAlertViewResponder {
    let alertview: SCLAlertView
    
    // Initialisation and Title/Subtitle/Close functions
    public init(alertview: SCLAlertView) {
        self.alertview = alertview
    }
    
    open func setTitle(_ title: String) {
        self.alertview.labelTitle.text = title
    }
    
    open func setSubTitle(_ subTitle: String) {
        self.alertview.viewText.text = subTitle
    }
    
    open func close() {
        self.alertview.hideView()
    }
    
    open func setDismissBlock(_ dismissBlock: @escaping DismissBlock) {
        self.alertview.dismissBlock = dismissBlock
    }
}

let kCircleHeightBackground: CGFloat = 62.0
let uniqueTag: Int = Int(arc4random() % UInt32(Int32.max))
let uniqueAccessibilityIdentifier: String = "SCLAlertView"

public typealias DismissBlock = () -> Void