//
//  EditContactViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 2/5/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit
import os.log

class EditContactViewController: UIViewController, UITextFieldDelegate {

    // Image
    @IBOutlet weak var imageView: UIImageView!
    // Text Fields
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var distanceLabel: UITextField!
    // Filled in from MainViewController in prepare
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the Image
        imageView.image = UIImage(named: (contact?.UIImageName)!)
        // Load the text fields
        nameLabel.text = contact?.name
        descriptionLabel.text = contact?.description
        distanceLabel.text = String(contact?.distance ?? -1)
        // Set the text fields as delegates to this class so when 'Enter' is hit, we execute textFieldShouldReturn
        nameLabel.delegate = self
        descriptionLabel.delegate = self
        distanceLabel.delegate = self
    }
    
    // MARK: - Text Field Delagate
    
    // When 'Enter' is hit, we get rid of the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Go back to MainViewController without updating any changes
    // For some reason, 'Cancel' does not call prepare
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // When 'Save' is hit, update the shared contact reference with the updated information
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         contact?.name = (nameLabel?.text!)!
         contact?.description = descriptionLabel.text!
         contact?.distance = Int((distanceLabel?.text)!) ?? 0
     }
}
