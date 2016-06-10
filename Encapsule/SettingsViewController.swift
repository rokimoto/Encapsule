//
//  SettingsViewController.swift
//  Encapsule
//
//  Created by Chow, Stephanie on 5/31/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let background = CAGradientLayer().gradientColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

        @IBAction func backButtonDidPress(sender: UIButton) {        self.dismissViewControllerAnimated(true, completion: {})
    
        }
}
