//
//  ToolTipViewController.swift
//  LudwigBot
//
//  Created by Kevin Bustillos Acurio on 26/10/16.
//  Copyright © 2016 Ode To Joy. All rights reserved.
//

import UIKit
import EasyTipView

class ToolTipViewController: UIViewController, EasyTipViewDelegate {

    @IBOutlet var ludwigTooltipImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Ludwig.display(message: "TOOLTIP ON THE NEXT SCREEN", onView: self.ludwigTooltipImageView, withinSuperview: self.view, delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func easyTipViewDidDismiss(_ tipView : EasyTipView) {
        tipView.dismiss()
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
