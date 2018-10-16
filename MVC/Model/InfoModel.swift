//
//  InfoModel.swift
//  MVC
//
//  Created by SENTHIL on 15/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class InfoModel: Codable {
    
    var name : String?
    var company : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case company
    }
}

