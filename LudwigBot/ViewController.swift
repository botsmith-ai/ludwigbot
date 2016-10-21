//
//  ViewController.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 21/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import UIKit
import EasyTipView

class ViewController: UIViewController, EasyTipViewDelegate {
    var preferences: EasyTipView.Preferences!
    var ludwigButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.- Customize tooltip preferences
        self.preferences = self.customizeTooltipPreferences()
        
        // 2.- Create the button
        self.ludwigButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.ludwigButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height - 20)
        self.ludwigButton.addTarget(self, action: #selector(ViewController.ludwigButtonDidPressed(sender:)), for: .touchUpInside)
        
        let buttonImage: UIImage = UIImage(named: "ludwig")!
        ludwigButton.setImage(buttonImage, for: .normal)
        
        self.view.addSubview(ludwigButton)
    }
    
    func ludwigButtonDidPressed(sender: UIButton) {
        // 3.- Show tooltip when button is pressed
        EasyTipView.show(animated: true, forView: self.ludwigButton, withinSuperview: self.view, text: "HELLO I'M A TOOLTIP", preferences: self.preferences, delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func customizeTooltipPreferences() -> EasyTipView.Preferences {
        var preferences: EasyTipView.Preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        return preferences
    }
    
    func easyTipViewDidDismiss(_ tipView : EasyTipView) {
        
    }
}

