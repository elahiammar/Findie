//
//  FDDataManager.swift
//  Findie
//
//  Created by elahiammar on 27/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation
import CoreLocation

final class DataManager {
    // MARK: - Properties
    static let shared = DataManager()
    var currentCoordinate: CLLocationCoordinate2D!
    
    // MARK: - Functions
    private init() {}
    
}
