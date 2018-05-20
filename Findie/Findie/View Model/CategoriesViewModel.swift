//
//  CategoriesViewModel.swift
//  Findie
//
//  Created by elahiammar on 24/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import Foundation

class CategoriesViewModel {
    // MARK: Properties
    private var categoriesArray = [Category]()
    private let categoriesDictionary: Dictionary<String, String> = ["Hotel": "hotel", "Restaurant": "restaurant",
                                                                    "Coffee": "coffee", "Gas Station": "gas",
                                                                    "Bus Station": "bus-station", "Clothing": "clothing",
                                                                    "Salon": "salon", "Grocery": "supermarket",
                                                                    "Hospital": "hospital", "Park": "park",
                                                                    "Pharmacy": "pharmacy", "Parking": "parking",
                                                                    "Library": "library", "Car Repair": "car-repair",
                                                                    "Airport": "airport", "Train Station": "train", "Police": "police"]
    
    // MARK: Functions

    func initialize() {
        // Location
        if LocationManager.shared.getCurrentCoordinate() == nil {
            LocationManager.shared.setupLocation()
            
        }
        // Prepare categoriesArray from Dictionary
        for (titleName, imageName) in categoriesDictionary {
            let category = Category.init(titleName: titleName, imageName: imageName)
            categoriesArray.append(category)
        }
    }
    
    func selectedItemName(with index: Int) -> String {
        let selectedCategory = categoriesArray[index]
        return selectedCategory.titleName
    }
}
