//
//  AuthorizationViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 11/30/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import Firebase

class AuthorizationViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    //MARK: Properties
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func leftButtonTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func rightButtonTapped(_ sender: Any) {
       
    }
}
