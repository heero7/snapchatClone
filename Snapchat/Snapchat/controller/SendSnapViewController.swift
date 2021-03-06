//
//  SendSnapViewController.swift
//  Snapchat
//
//  Created by Kevin Mudiandambo on 12/6/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit
import FirebaseStorage

class SendSnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Outlets
    @IBOutlet weak var snapImageView: UIImageView!
    @IBOutlet weak var snapCaptionTextField: UITextField!
    
    // image name for firebase
    var imageName = "\(NSUUID().uuidString).jpeg"
    // url for firebase
    var url = ""
    
    //MARK: Properties
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    //MARK: Actions
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func myPhotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let imageFolder = Storage.storage().reference().child("images")
        
        if let image = snapImageView.image {
            if let imageData = UIImageJPEGRepresentation(image, 0.1) {
                imageFolder.child(imageName).putData(imageData, metadata: nil, completion: { (meta, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let imageURL = meta?.downloadURL()?.absoluteString {
                            self.url = imageURL
                            self.performSegue(withIdentifier: "sendToUsers", sender: nil)
                        }
                    }
                })
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            snapImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectUsersVC = segue.destination as? SelectUsersToSendSnapTableViewController {
            selectUsersVC.imageURL = url
            if let message = snapCaptionTextField.text {
                selectUsersVC.caption = message
            }
            selectUsersVC.imageName = imageName
        }
    }
}
