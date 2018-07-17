//
//  Category.swift
//  Findie
//
//  Created by elahiammar on 28/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import Foundation

class Category: NSObject {
    var titleName: String!
    var imageName: String!
    
    init(titleName: String?, imageName: String?) {
        // Check nil value in title and image strings
        guard titleName != nil, imageName != nil else {
            return
            
        }
        // Set the value
        self.titleName = titleName!
        self.imageName = imageName!
    }
    
}

