//
//  ViewController.swift
//  lab4
//
//  Created by Eric LaBouve on 1/28/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import UIKit
import os.log

class EditViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var contactFromTable: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = contactFromTable?.name
        profileImage.image = contactFromTable?.image
        descriptionLabel.text = contactFromTable?.description
        distanceLabel.text = String(contactFromTable!.distance) + " miles"
    }

    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        os_log("Unwind", log: OSLog.default, type: .debug)
    }
}

