//
//  ViewController.swift
//  Encapsule
//
//  Created by momo on 5/15/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit
import FBSDKLoginKit

extension CALayer { func setBorderColorFromUIColor(color: UIColor) { self.borderColor = color.CGColor } }

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = CAGradientLayer().gradientColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                //                let friends : NSArray = result.valueForKey("user_friends") as! NSArray
                //                print("User Friends are:")
                //                print(friends)
            }
        })
    }
    
    @IBAction func fbBtnPressed(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["public_profile", "user_friends"], fromViewController: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if(fbloginresult.grantedPermissions.contains("public_profile"))
                {
                    self.returnUserData()
                }
            }
        }
    }
}

