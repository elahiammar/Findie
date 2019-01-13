//
//  ResultsTableViewController.swift
//  Findie
//
//  Created by elahiammar on 26/11/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ResultsTableViewController: UITableViewController {

    // MARK: - Properties
    
   fileprivate var viewModel: ResultsViewModel = ResultsViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if LocationManager.shared.isLocationPermissionGranted() == false {
            let alertController = UIAlertController(title: "Go to the Settings?", message: "The location permission was not authorized. Please enable it in the Settings to continue.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
                if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSetting, options: [:], completionHandler: nil)
                    
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            present(alertController, animated: true, completion: nil)
        }
    }
 
    // MARK: - Functions
    
    public func searchLocation(with locationName: String) {
        if LocationManager.shared.getCurrentCoordinates() != nil {
            viewModel.searchLocation(with: locationName)
        }
    }
    
}
