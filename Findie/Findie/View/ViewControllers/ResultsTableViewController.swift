//
//  ResultsTableViewController.swift
//  Findie
//
//  Created by elahiammar on 26/11/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import MapKit

class ResultsTableViewController: UITableViewController {

    // MARK: - Properties
    
    fileprivate var viewModel: ResultsViewModel = ResultsViewModel(intWebServices: WebServices())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if LocationManager.shared.isLocationPermissionGranted() == false {
            let alertController = UIAlertController(title: "Go to the Settings?", message: "The location permission was not authorized. Please enable it in the Settings to continue.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
                if let appSetting = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(appSetting, options: [:], completionHandler: nil)
                    
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsTableViewCell", for: indexPath) as! SearchResultsTableViewCell
        return cell
        
    }
    
    // MARK: - Private Functions
    
    private func setupTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: "SearchResultsTableViewCell")
    }
    
    // MARK: - Public Functions
    
    public func searchLocation(with locationName: String) {
        if LocationManager.shared.getCurrentCoordinate() != nil {
            viewModel.searchLocation(with: locationName)
            
        }
    }
    
}
