//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/7/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class ViewSnapViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var snapImage: UIImageView!
    
    // MARK: Properties
    var snapshot : DataSnapshot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let snapshot = snapshot {
            if let snapDictionary = snapshot.value as? NSDictionary {
                if let from = snapDictionary["from"] as? String {
                    if let imageName = snapDictionary["imageName"] as? String {
                        if let imageURL = snapDictionary["imageURL"] as? String {
                            if let message = snapDictionary["message"] as? String {
                                caption.text = message
                                
                                if let url = URL(string: imageURL) {
                                    snapImage.sd_setImage(with: url)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
