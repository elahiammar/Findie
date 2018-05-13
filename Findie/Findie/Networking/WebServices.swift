//
//  WebServices.swift
//  Findie
//
//  Created by elahiammar on 22/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

struct WebServices: WebServicesProtocol {
    // Search Location
    func searchLocation(with locationName: String, completionHandler: @escaping CompletionHandler) {
        let coordinate = LocationManager.shared.getCurrentCoordinate()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = locationName
        request.region = MKCoordinateRegionMakeWithDistance(coordinate!, 10000, 10000)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            print(response?.mapItems)
            
        }
    }
    
}
