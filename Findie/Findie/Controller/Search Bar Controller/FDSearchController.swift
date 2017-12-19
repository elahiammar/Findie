//
//  FDSearchController.swift
//  Findie
//
//  Created by elahiammar on 02/10/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit

class FDSearchController: UISearchController {

    // MARK: - Initialization
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        // Customize searchBar
        searchBar.setSerchTextcolor(color: UIColor.red)
       customizeSearchBar()
        searchBar.setSerchTextcolor(color: UIColor.red)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    
    func customizeSearchBar() {
        if let searchField = searchBar.value(forKey: "searchField") as? UITextField {
            if let backgroundview = searchField.subviews.first {
                // Background color
                backgroundview.backgroundColor = UIColor.white
                //searchField.textColor = UIColor.black
                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
                
            }
        }
    }
}

extension UISearchBar {
    public func setSerchTextcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }
}
