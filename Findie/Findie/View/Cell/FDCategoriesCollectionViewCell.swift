//
//  FDCategoriesCollectionViewCell.swift
//  Findie
//
//  Created by elahiammar on 21/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit

class FDCategoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    // MARK: - Functions
    
    func confiureCellWith(category: FDCategory) {
        // Configure cell
        titleLabel.text = category.titleName
        iconImageView.image = UIImage(named: category.imageName)
        
    }
}
