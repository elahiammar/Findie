//
//  FDResultsViewModel.swift
//  Findie
//
//  Created by elahiammar on 27/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation

class FDResultsViewModel {

    // MARK: Properties
    
    var webService: WebServicesProtocol

    // MARK: Functions
    
    init(intWebServices webServices: WebServices) {
        webService = webServices
    }
    
    func callWebService() {
        webService.searchLocation(with: "Lahore") { (dataArray, error) in
            
        }
    }
    
}
