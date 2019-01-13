//
//  ResultsViewModel.swift
//  Findie
//
//  Created by elahiammar on 27/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation

class ResultsViewModel {

    // MARK: Properties
   
    // MARK: Functions

    func searchLocation(with locationName: String) {
        if let coordinates = LocationManager.shared.getCurrentCoordinates() {
            let latLong = "\(coordinates.latitude), \(coordinates.longitude)"
            print(latLong)
//            APIClient.location(name: locationName, latLong: latLong) { results in
//                print(results)
//            }
        }
    }
    
}
