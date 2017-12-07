//
//  SendSnapViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/6/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class SendSnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Outlets
    @IBOutlet weak var snapImageView: UIImageView!
    @IBOutlet weak var snapCaptionTextField: UITextField!
    
    //MARK: Properties
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    //MARK: Actions
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
    }
    
    @IBAction func myPhotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
    }
    
    @IBAction func nextTapped(_ sender: Any) {
    }
}
