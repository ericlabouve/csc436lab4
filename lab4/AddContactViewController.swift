//
//  AddContactViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 2/5/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit
import os.log

class AddContactViewController: UIViewController {

    // Image View
    @IBOutlet weak var imageView: UIImageView!
    // Text Fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var distanceField: UITextField!
    // Buttons
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var contact: Contact?
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos = [UIImage(named: "sloth1")!, UIImage(named: "sloth2")!, UIImage(named: "sloth3")!, UIImage(named: "sloth4")!, UIImage(named: "sloth5")!, UIImage(named: "sloth6")!, UIImage(named: "sloth7")!, UIImage(named: "sloth8")!]
        imageView.image = photos[Int.random(in: 0..<photos.count)]
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameField.text ?? ""
        let dist = Int(distanceField.text ?? "0") ?? 0
        let desc = descriptionField.text ?? ""
        let image = imageView.image!
        contact = Contact(name: name, distance: dist, description: desc, image: image)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
