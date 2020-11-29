
//
//  TextFieldEffects.swift
//  TextFieldEffects
//
//  Created by Raúl Riera on 24/01/2015.
//  Copyright (c) 2015 Raul Riera. All rights reserved.
//

import UIKit

extension String {
    /**
     true if self contains characters.
     */
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

/**
 A TextFieldEffects object is a control that displays editable text and contains the boilerplates to setup unique animations for text entry and display. You typically use this class the same way you use UITextField.
 */
open class TextFieldEffects : UITextField {
    /**
     The type of animation a TextFieldEffect can perform.
     
     - TextEntry: animation that takes effect when the textfield has focus.
     - TextDisplay: animation that takes effect when the textfield loses focus.
     */
    public enum AnimationType: Int {
        case textEntry
        case textDisplay
    }
    
    /**
     Closure executed when an animation has been completed.
     */
    public typealias AnimationCompletionHandler = (_ type: AnimationType)->()
    
    /**
     UILabel that holds all the placeholder information
     */
    open let placeholderLabel = UILabel()
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */