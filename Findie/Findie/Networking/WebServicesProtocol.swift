//
//  WebServicesProtocol.swift
//  Findie
//
//  Created by elahiammar on 22/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Foundation

// Callback for retrieving list of location
typealias CompletionHandler = (NSMutableArray?, Error?) -> Void

protocol WebServicesProtocol {
    func searchLocation(with locationName: String, completionHandler: @escaping CompletionHandler)
}
