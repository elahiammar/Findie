//
//  FDCategoriesViewModel.swift
//  Findie
//
//  Created by elahiammar on 24/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import Foundation

class FDCategoriesViewModel {
    // MARK: Properties
    
    var categoriesArray = [FDCategory]()
    
    // MARK: Functions

    func initializeCategoriesArray() {
        // Prepare categoriesArray from Dictionary
        for (titleName, imageName) in Constants.categoriesDictionary {
            let category = FDCategory.init(titleName: titleName, imageName: imageName)
            categoriesArray.append(category)
        }
    }
    
    func selectedItemName(with index: Int) -> String {
        let selectedCategory = categoriesArray[index]
        return selectedCategory.titleName
    }
}
