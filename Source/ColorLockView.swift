//
//  ColorLockView.swift
//  DatePickerCell
//
//  Created by Dylan Vann on 2015-05-13.
//  Copyright (c) 2015 Dylan Vann. All rights reserved.
//

import Foundation
import UIKit

class DVColorLockView:UIView {
    
    var lockedBackgroundColor:UIColor {
        set {
            super.backgroundColor = newValue
        }
        get {
            return super.backgroundColor!
        }
    }
    
    override var backgroundColor:UIColor? {
        set {
        }
        get {
            return super.backgroundColor
        }
    }
}