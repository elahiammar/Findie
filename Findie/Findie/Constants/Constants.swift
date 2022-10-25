//
//  Constants.swift
//  Findie
//
//  Created by elahiammar on 24/09/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let baseURL = "https://api.foursquare.com/v2"
    }
    
    struct APIParameterKey {
        static let coordinates = "ll"
        static let radius = "radius"
        static let query = "query"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Acceptj"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
