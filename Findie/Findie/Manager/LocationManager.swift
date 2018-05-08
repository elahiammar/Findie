//
//  LocationManager.swift
//  Findie
//
//  Created by elahiammar on 27/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D!
    
    // MARK: - Life Cycle
    
    private override init() {}
    
    // MARK: - Public Functions
    
    func getCurrentCoordinate() -> CLLocationCoordinate2D {
        return self.currentCoordinate
    }
    
    func setupLocation() {
        // Enable location
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func isLocationPermissionGranted() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            // Check Authorization Status
            switch CLLocationManager.authorizationStatus() {
           
            case .notDetermined, .restricted, .denied:
                return false
                
            case .authorizedAlways, .authorizedWhenInUse:
                return true
                
            }
        }
        return false
    }
    
    // MARK: - CLLocationManagerDelegate
    
    internal func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            currentCoordinate = locations.first?.coordinate
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    
}
