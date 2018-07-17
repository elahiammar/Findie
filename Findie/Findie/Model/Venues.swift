//
//  Place.swift
//  Findie
//
//  Created by elahiammar on 14/07/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation
import CoreLocation

struct Venues: Codable {
    let id: String
    let name: String
    let location: Location
}

struct Location: Codable {
    let address: String
    let lat: Int
    let lng: Int
    let distance: Int
}
