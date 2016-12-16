//
//  Ludwig.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 21/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import Foundation
import UIKit
import EasyTipView

class Ludwig {
    static var duration: TimeInterval = 5.0
    
    
    /**
     Display tooltip
     
     - returns:
     EasyTipView which will be use to be dismissed later
     
     - parameters:
        - message: Message that will be displayed within the tooltip
        - currentView: View where will be displayed the whole bubble
        - currentSuperView: Current view's superview
        - icon: Icon displayed within the bubble (not implmeneted yet). By default there's no icon
        - duration: Bubble's duration before dismissing (not implemented yet). Could call a completion method.
    */
    class func display(message: String, onView currentView: UIView, withinSuperview currentSuperview: UIView, icon: UIImage = UIImage()) {
        let tipView: EasyTipView = EasyTipView(text: message)
        tipView.show(animated: true, forView: currentView, withinSuperview: currentSuperview)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + self.duration) {
            tipView.dismiss()
        }
    }
}
