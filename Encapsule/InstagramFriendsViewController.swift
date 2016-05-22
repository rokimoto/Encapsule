//
//  InstagramFriendsViewController.swift
//  Encapsule
//
//  Created by momo on 5/16/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit
import OAuthSwift

class InstagramFriendsViewController: UITableViewController {

    var names = [String]()

    let services = Services()

    func login(){
        let oauthswift = OAuth2Swift(
            consumerKey:    services["Instagram"]!["consumerKey"]!,
            consumerSecret: services["Instagram"]!["consumerSecret"]!,
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )

        let state: String = generateStateWithLength(20) as String
        oauthswift.authorizeWithCallbackURL( NSURL(string: "Encapsule://oauth-callback")!, scope: "likes+comments+follower_list", state:state, success: {
            credential, response, parameters in
            print(credential.oauth_token)
            self.showTokenAlert(credential)
            self.getFriendsList(oauthswift)
            }, failure: { error in
                print("failure")
                print(error.localizedDescription)
        })
    }

    func getFriendsList(oauthswift: OAuth2Swift) {
        let url :String = "https://api.instagram.com/v1/users/self/follows/?access_token=\(oauthswift.client.credential.oauth_token)"
        let parameters :Dictionary = Dictionary<String, AnyObject>()
        oauthswift.client.get(url, parameters: parameters,
                              success: {
                                data, response in
                                do {
                                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                                    print(json["data"])
                                    if let users = json["data"] as? [[String: AnyObject]] {
                                        for user in users {
                                            print(user)
                                            if let name = user["full_name"] as? String {
                                                self.names.append(name)
                                            }
                                        }
                                    }
                                } catch {
                                    print("error serializing JSON: \(error)")
                                }

                                print(self.names)
                                self.tableView.reloadData()


            }, failure: { error in
                print(error)
        })
    }

    func showTokenAlert(credential: OAuthSwiftCredential) {
        print(credential)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
