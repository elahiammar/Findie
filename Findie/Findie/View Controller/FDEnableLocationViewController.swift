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
            
        } else {
            showAlert(title: "Go to the Settings?", message: "The location permission was not authorized. Please enable it in Settings to continue.")
        }
    }
    
    // MARK: - Functions
    
    private func moveToCategoriesViewController() {
        // Move to categories controller
        let categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "FDCategoriesCollectionViewController") as! FDCategoriesCollectionViewController
        let navigationController = UINavigationController(rootViewController: categoriesViewController)
        //        navigationController.navigationBar.prefersLargeTitles = true
//        navigationController.navigationBar.prefersLargeTitles = true
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(displayP3Red: 1.0/255.0, green: 178.0/255.0, blue: 148.0/255.0, alpha: 1.0)]
        present(navigationController, animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // OK Action
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let appSetting = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(appSetting, options: [:], completionHandler: nil)
                
            }
        }
        
        // Cancel Action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    internal func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
            moveToCategoriesViewController()
            
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            DataManager.shared.currentCoordinate = locations.first?.coordinate
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    
}
