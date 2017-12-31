//
//  FDResultsTableViewController.swift
//  Findie
//
//  Created by elahiammar on 26/11/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import MapKit

class FDResultsTableViewController: UITableViewController {

    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
    }

    func setupTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(FDSearchResultsTableViewCell.self, forCellReuseIdentifier: "FDSearchResultsTableViewCell")
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FDSearchResultsTableViewCell", for: indexPath) as! FDSearchResultsTableViewCell
        return cell
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - Extension FDResultsTableViewController

extension FDResultsTableViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()

        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: (location)")
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: (error)")
        
    }
    
}

