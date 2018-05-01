//
//  FDEnableLocationViewController.swift
//  Findie
//
//  Created by elahiammar on 01/05/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import UIKit
import CoreLocation

class FDEnableLocationViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Enable location
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: - Actions
    
    @IBAction func enableLocationTapped(_ sender: UIButton) {
        if DataManager.shared.currentCoordinate != nil {
            moveToCategoriesViewController()
        }
    }
    
    // MARK: - Functions
    
    private func moveToCategoriesViewController() {
        // Move to categories controller
        let categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "FDCategoriesCollectionViewController") as! FDCategoriesCollectionViewController
        let navigationController = UINavigationController(rootViewController: categoriesViewController)
//        navigationController.navigationBar.prefersLargeTitles = true
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(displayP3Red: 1.0/255.0, green: 178.0/255.0, blue: 148.0/255.0, alpha: 1.0)]
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            DataManager.shared.currentCoordinate = locations.first?.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    

}
