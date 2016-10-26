//
//  ToolTipViewController.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 26/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import UIKit
import EasyTipView

class ToolTipViewController: UIViewController {
    var ludwigButton: UIButton!
    var tipView: EasyTipView!
    
    @IBOutlet var ludwigTooltipImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 2.- Create the button
        self.ludwigButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.ludwigButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height - 40)
        self.ludwigButton.addTarget(self, action: #selector(ViewController.ludwigButtonDidPressed(sender:)), for: .touchUpInside)
        
        let buttonImage: UIImage = UIImage(named: "ludwig")!
        ludwigButton.setImage(buttonImage, for: .normal)
        
        self.view.addSubview(ludwigButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
