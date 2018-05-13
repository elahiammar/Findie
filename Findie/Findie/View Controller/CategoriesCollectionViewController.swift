//
//  CategoriesCollectionViewController.swift
//  Findie
//
//  Created by elahiammar on 21/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategoriesCollectionViewCell"

class CategoriesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var searchController: SearchController!
    let screenSize: CGSize = UIScreen.main.bounds.size
    fileprivate var viewModel: CategoriesViewModel = CategoriesViewModel()
    var resultsViewController: ResultsTableViewController = ResultsTableViewController()
   
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        LocationManager.shared.setupLocation()
        
        // Set FromSafeArea for UICollectionViewFlowLayoutSectionInsetReference
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.sectionInsetReference = .fromSafeArea
            
        }
        viewModel.initialize()
        collectionView?.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    
    func setupNavigationBar() {
        searchController = SearchController(searchResultsController: resultsViewController)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            // Get selected cell indexPath and find location according to selected item name
            let indexPath = collectionView?.indexPath(for: sender as! CategoriesCollectionViewCell)
            let destinationViewController = segue.destination as! ResultsTableViewController
            let slectedItemName = viewModel.selectedItemName(with: indexPath!.item)
            destinationViewController.searchLocation(with: slectedItemName)
        }
    }

 
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoriesCollectionViewCell
        let category: Category = viewModel.categoriesArray[indexPath.row]
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
