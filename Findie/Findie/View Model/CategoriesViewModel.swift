//
//  CategoriesViewModel.swift
//  Findie
//
//  Created by elahiammar on 24/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import RxSwift
import RxCocoa

class CategoriesViewModel {
   
    // MARK: Properties
    
    var categories: Observable<[Category]> {
        return self.categoriesBehaviorRelay.asObservable()
    }
    
    private var categoriesBehaviorRelay = BehaviorRelay<[Category]>(value: [])
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
        if LocationManager.shared.getCurrentCoordinates() == nil {
            LocationManager.shared.setupLocation()
            
        }

        // Prepare categoriesArray from Dictionary
        var categoriesArray = [Category]()
        for (titleName, imageName) in categoriesDictionary {
            let category = Category.init(titleName: titleName, imageName: imageName)
            categoriesArray.append(category)
        }
        categoriesBehaviorRelay.accept(categoriesArray)
    }
    
    func selectedItemName(with index: Int) -> String {
        let selectedCategory = categoriesBehaviorRelay.value[index]
        return selectedCategory.titleName
    }

}
