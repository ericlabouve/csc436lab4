//
//  Contact.swift
//  lab4
//
//  Created by Eric LaBouve on 1/28/19.
//  Copyright © 2019 Eric LaBouve. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    
    var name: String
    var distance: Int
    var description: String
    var image: UIImage
    
    init(name: String, distance: Int, description: String, image: UIImage) {
        self.name = name
        self.distance = distance
        self.description = description
        self.image = image
    }
}
