//
//  Ludwig.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 21/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import Foundation
import UIKit

class Ludwig {
    var message: String
    var icon: UIImage
    var duration: TimeInterval
    
    init(message: String, icon: UIImage, duration: TimeInterval) {
        self.message = message
        self.icon = icon
        self.duration = duration
    }
    
    func display(message: String, icon: UIImage = UIImage(), duration: TimeInterval = 5.0) -> String {
        return message
    }
}
