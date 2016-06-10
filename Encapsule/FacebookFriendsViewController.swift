//
//  FacebookFriendsViewController.swift
//  Encapsule
//
//  Created by Rachel Okimoto on 5/25/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import FBSDKLoginKit

class FacebookViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Facebook access
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            returnUserData()
        }
        else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "user_friends"]
            loginView.delegate = self
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
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
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            exit(-1)
        }
        else if result.isCancelled {
            // Do nothing if cancelled
        }
        else {
            returnUserData()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {}
}