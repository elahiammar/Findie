//
//  EnableLocationViewController.swift
//  Findie
//
//  Created by elahiammar on 01/05/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import UIKit

class EnableLocationViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func enableLocationTapped(_ sender: UIButton) {
        LocationManager.shared.setupLocation()
    }
    
    // MARK: - Functions
    
    private func moveToCategoriesViewController() {
        // Move to categories controller
        let categoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesCollectionViewController") as! CategoriesCollectionViewController
        let navigationController = UINavigationController(rootViewController: categoriesViewController)
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
    
    
    
}
