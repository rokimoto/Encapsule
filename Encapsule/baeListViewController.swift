//
//  baeListViewController.swift
//  Encapsule
//
//  Created by Chow, Stephanie on 5/30/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit

class baeListViewController: UIViewController, UITableViewDataSource {
    var myBae = [
        Bae(),
        Bae()
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = CAGradientLayer().gradientColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBae.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("baeListTableViewCell")! as! baeListTableViewCell
        
        
        cell.mainDescriptionLabel?.text = "\(myBae[indexPath.row].description()) \(indexPath.row + 1)"
        
        return cell
 }
    
    
//    @IBAction func backButtonDidPress(sender: UIButton) {        self.dismissViewControllerAnimated(true, completion: {})
//
//    }
    
}

