//
//  UISearchBar+CustomColor.swift
//  Findie
//
//  Created by elahiammar on 10/10/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    // Get view by type
    private func getViewElement<T>(type: T.Type) -> T? {
        let elementSubviews = subviews.flatMap{ $0.subviews }
        guard let element = (elementSubviews.filter {$0 is T}).first as? T else {
            return nil
            
        }
        return element
        
    }
    
    func getSearchBarTextField() -> UITextField? {
        return getViewElement(type: UITextField.self)
        
    }
    
    func setTextColor(color: UIColor) {
        if let textField = getSearchBarTextField() {
            textField.textColor = color
            
        }
    }
    
    func setTextFieldColor(color: UIColor) {
        if let textField = getSearchBarTextField() {
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 15
            textField.layer.masksToBounds = true
             textField.textColor = color
        }
    }
    
    func setPlaceholderTextColor(color: UIColor) {
        if let textField = getSearchBarTextField() {
            textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor: color])
            
        }
    }
}

