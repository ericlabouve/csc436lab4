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
    
    var photoNames: [String] = []
    var photoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load a random image and save the image's name
        photoNames = ["sloth1", "sloth2", "sloth3", "sloth4", "sloth5", "sloth6", "sloth7", "sloth8"]
        photoName = photoNames[Int.random(in: 0..<photoNames.count)]
        imageView.image = UIImage(named: photoName)
        // Load the text fields
        nameField.text = ""
        descriptionField.text = ""
        distanceField.text = ""
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
        contact = Contact(name: name, distance: dist, description: desc, UIImageName: photoName)
    }
    
}
