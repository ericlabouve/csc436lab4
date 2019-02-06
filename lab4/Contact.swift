//
//  Contact.swift
//  lab4
//
//  Created by Eric LaBouve on 1/28/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import Foundation
import UIKit

class Contact : Codable {
    
    var name: String
    var distance: Int
    var description: String
    // UIImage is not 'Codable' for some reason. So we store the name of the image
    // and then load the image whenever we need to display it.
    var UIImageName: String
    
    init(name: String, distance: Int, description: String, UIImageName: String) {
        self.name = name
        self.distance = distance
        self.description = description
        self.UIImageName = UIImageName
    }
}
