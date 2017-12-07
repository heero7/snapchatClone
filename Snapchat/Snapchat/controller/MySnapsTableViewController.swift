//
//  MySnapsTableViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/4/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class MySnapsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: Outlet functions
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
