//
//  CategoriesCollectionViewController.swift
//  Findie
//
//  Created by elahiammar on 21/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import RxSwift

class CategoriesCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private var searchController: SearchController!
    private let screenSize: CGSize = UIScreen.main.bounds.size
    private let viewModel: CategoriesViewModel = CategoriesViewModel()
    private let disposebag = DisposeBag()
    private let resultsViewController: ResultsTableViewController = ResultsTableViewController()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        viewModel.initialize()
        bindCategories()
    }
    
    // MARK: - Functions
    
    private func setupNavigationBar() {
        searchController = SearchController(searchResultsController: resultsViewController)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func setupCollectionView() {
        collectionView?.dataSource = nil
        collectionView?.delegate = nil
        
        // UICollectionViewFlowLayout
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInsetReference = .fromSafeArea
            // Show 3 cells in portrait
            let numberOfItemsPerRow: CGFloat = 3.0
            // Left Right Padding
            let leftRightPadding: CGFloat = 20.0
            
            let width = (collectionView!.frame.size.width / numberOfItemsPerRow) - leftRightPadding
            let height = width
            flowLayout.itemSize = CGSize(width: width, height: height)
            collectionView?.setCollectionViewLayout(flowLayout, animated: true)   
        }
    }
    
    private func bindCategories() {
        viewModel.categories.bind(to: collectionView!.rx.items(cellIdentifier: "CategoriesCollectionViewCell", cellType: CategoriesCollectionViewCell.self)) { _, cateogry, cell in
            cell.confiureCell(with: cateogry)
            
        }.disposed(by: disposebag)
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

}
