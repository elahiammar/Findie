//
//  FDCategoriesCollectionViewController.swift
//  Findie
//
//  Created by elahiammar on 21/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import CoreLocation

private let reuseIdentifier = "FDCategoriesCollectionViewCell"

class FDCategoriesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var searchController: FDSearchController!
    var resultsViewController: FDResultsTableViewController = FDResultsTableViewController()
    var viewModel: FDCategoriesViewModel = FDCategoriesViewModel()
    private let screenSize: CGSize = UIScreen.main.bounds.size
    let locationManager = CLLocationManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLocation()
        
        // Set FromSafeArea for UICollectionViewFlowLayoutSectionInsetReference
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.sectionInsetReference = .fromSafeArea
            
        }
        // Initalize categories array to populate data
        viewModel.initializeCategoriesArray()
        collectionView?.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    
    func setupNavigationBar() {
        searchController = FDSearchController(searchResultsController: resultsViewController)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesArray.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FDCategoriesCollectionViewCell
        let category: FDCategory = viewModel.categoriesArray[indexPath.row] as! FDCategory
        // Configure the cell
        cell.confiureCellWith(category: category)
        return cell
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Show 3 cells in portrait
        let numberOfItemsPerRow: CGFloat = 3.0
        
        // Left Right Padding
        let leftRightPadding: CGFloat = 20.0
        
        let width = (collectionView.frame.size.width / numberOfItemsPerRow) - leftRightPadding
        let height = width
        return CGSize(width: width, height: height)

    }
}

// MARK: - Extension FDResultsTableViewController

extension FDCategoriesCollectionViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            print("location:: (location)")
            DataManager.shared.currentCoordinate = locations.first?.coordinate
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: (error)")
        
    }
    
}
