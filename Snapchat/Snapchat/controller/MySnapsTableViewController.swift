//
//  MySnapsTableViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/4/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MySnapsTableViewController: UITableViewController {
    
    var snaps : [DataSnapshot] = []
    
    override func viewWillAppear(_ animated: Bool) {
        //makes navigation color blue
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSnaps()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return snaps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier2", for: indexPath)
        
        let snap = snaps[indexPath.row]
        
        if let snapDictionary = snap.value as? NSDictionary {
            if let from = snapDictionary["from"] as? String {
                cell.textLabel?.text = from
            }
        }
        return cell
    }
    
    // MARK: Outlet functions
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func loadSnaps(){
        if let loggedInUser = Auth.auth().currentUser?.uid {
            Database.database().reference().child("users").child(loggedInUser).child("snaps").observe(.childAdded, with: { (snapshot) in
                    self.snaps.append(snapshot)
                    self.tableView.reloadData()
//                    if let from = snapDictionary["from"] as? String {
//                        if let imageName = snapDictionary["imageName"] as? String {
//                            if let imageURL = snapDictionary["imageURL"] as? String {
//                                if let caption = snapDictionary["message"]
//                            }
//                        }
//                    }
            })
        }
        
    }
}
