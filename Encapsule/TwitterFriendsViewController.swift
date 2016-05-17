//
//  TwitterFriendsViewController.swift
//  Encapsule
//
//  Created by momo on 5/16/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit
import OAuthSwift

class TwitterFriendsViewController: UITableViewController {

    var names = [String]()
    
    let services = Services()
    
    func doOAuthTwitter(){
        let oauthswift = OAuth1Swift(
            consumerKey:    services["Twitter"]!["consumerKey"]!,
            consumerSecret: services["Twitter"]!["consumerSecret"]!,
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        oauthswift.authorizeWithCallbackURL( NSURL(string: "encapsule://oauth-callback")!, success: {
            credential, response, parameters in
            self.showTokenAlert(credential)
            self.getTwitterFriends(oauthswift)
            }, failure: { error in
                print(error.localizedDescription)
            }
        )
    }
    
    func getTwitterFriends(oauthswift: OAuth1Swift) {
        oauthswift.client.get("https://api.twitter.com/1.1/friends/list.json", parameters: [:],
                              success: {
                                data, response in
                                let jsonDict: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                                print(jsonDict["users"])
                                if let users = jsonDict["users"] as? [[String: AnyObject]] {
                                    for user in users {
                                        if let name = user["name"] as? String {
                                            self.names.append(name)
                                        }
                                    }
                                }
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
