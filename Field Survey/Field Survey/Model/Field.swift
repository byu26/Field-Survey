//
//  Field.swift
//  Field Survey
//
//  Created by Bryan Yu on 4/6/18.
//  Copyright © 2018 Bryan Yu. All rights reserved.
//

import UIKit

enum Field: String{
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
