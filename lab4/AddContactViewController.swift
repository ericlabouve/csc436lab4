//
//  AddContactViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 2/5/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit
import os.log

class AddContactViewController: UIViewController, UITextFieldDelegate {

    // Image View
    @IBOutlet weak var imageView: UIImageView!
    // Text Fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var distanceField: UITextField!
    // The contact to fill out and return to MainViewController
    var contact: Contact?
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load all possible images and select an image at random
        photos = [UIImage(named: "sloth1")!, UIImage(named: "sloth2")!, UIImage(named: "sloth3")!, UIImage(named: "sloth4")!, UIImage(named: "sloth5")!, UIImage(named: "sloth6")!, UIImage(named: "sloth7")!, UIImage(named: "sloth8")!]
        imageView.image = photos[Int.random(in: 0..<photos.count)]
        nameField.text = ""
        descriptionField.text = ""
        distanceField.text = "0"
        // Will call rextFieldShouldReturn when return is hit
        nameField.delegate = self
        descriptionField.delegate = self
        distanceField.delegate = self
    }
    
    // MARK: - Text Field Delagate
    
    // Dismisses the keyboard when return is hit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - Navigation

    // Go back to MainViewController without making a new contact
    // Hitting 'Cancel' does not call prepare
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // Executed with 'Save' is hit
    // Fills out Contact details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameField.text!
        let dist = Int(distanceField.text ?? "0") ?? 0
        let desc = descriptionField.text!
        let image = imageView.image!
        contact = Contact(name: name, distance: dist, description: desc, image: image)
    }
    
}
