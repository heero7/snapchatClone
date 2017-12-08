//
//  SelectUsersToSendSnapTableViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/6/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SelectUsersToSendSnapTableViewController: UITableViewController {
    
    var imageName = ""
    var imageURL = ""
    var caption = ""
    
    var users : [SnapUser] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            // unwrap the dictionary
            if let userDictionary = snapshot.value as? NSDictionary {
                if let email = userDictionary["email"] as? String {
                    let user = SnapUser()
                    user.email = email
                    user.uid = snapshot.key
                    self.users.append(user)
                    // reload the data
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        // access to the current user logged in
        //Auth.auth().currentUser?.email
    }
    
}
