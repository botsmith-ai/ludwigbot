//
//  ViewController.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 21/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import UIKit
import EasyTipView

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    var preferences: EasyTipView.Preferences!
    var ludwigButton: UIButton!
    var tipView: EasyTipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.- Customize tooltip preferences
        self.preferences = self.customizeTooltipPreferences()
        
        // 2.- Create the button
        self.ludwigButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.ludwigButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height - 40)
        self.ludwigButton.addTarget(self, action: #selector(ViewController.ludwigButtonDidPressed(sender:)), for: .touchUpInside)

        let buttonImage: UIImage = UIImage(named: "ludwig")!
        ludwigButton.setImage(buttonImage, for: .normal)
        
        self.view.addSubview(ludwigButton)
    }
    
    func ludwigButtonDidPressed(sender: UIButton) {
        // 3.- Add timer to dismiss tooltip's bubble lapsed 5 seconds
        Timer.scheduledTimer(timeInterval: TimeInterval(5.0), target: self, selector: #selector(ToolTipViewController.dismiss(notification:)), userInfo: nil, repeats: false)
        
        // 4.- Show tooltip when button is pressed
        self.tipView = Ludwig.display(message: "Hello World!", onView: self.ludwigButton, withinSuperview: self.view)
    }
    
    // 5.- Dismiss method lapsed 5 seconds
    func dismiss(notification: NSNotification) {
        self.tipView.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func customizeTooltipPreferences() -> EasyTipView.Preferences {
        var preferences: EasyTipView.Preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.red
        preferences.drawing.arrowPosition = .any
        
        EasyTipView.globalPreferences = preferences
        
        return preferences
    }
}

