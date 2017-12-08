//
//  AuthorizationViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 11/30/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

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
    @IBAction func signUpTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let user = user {
                            Database.database().reference().child("users").child(user.uid).child("email").setValue(email)
                            self.performSegue(withIdentifier: "authToMySnap", sender: nil)
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.performSegue(withIdentifier: "authToMySnap", sender: nil)
                    }
                })
            }
        }
    }
    
    // MARK: Private functions
    
}
