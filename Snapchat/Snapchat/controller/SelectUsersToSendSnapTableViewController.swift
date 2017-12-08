//
//  SelectUsersToSendSnapTableViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/6/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SelectUsersToSendSnapTableViewController: UITableViewController {
    
    var imageName = ""
    var imageURL = ""
    var caption = ""
    
    var emails : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            // unwrap the dictionary
            if let userDictionary = snapshot.value as? NSDictionary {
                if let email = userDictionary["email"] as? String {
                    self.emails.append(email)
                    // reload the data
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = emails[indexPath.row]
        
        return cell
    }
    
}
