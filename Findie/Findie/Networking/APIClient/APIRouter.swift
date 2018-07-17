//
//  APIRouter.swift
//  Findie
//
//  Created by elahiammar on 15/06/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case search(coordinates: String, radius: String, query: String)
   
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
    
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .search:
            return "/venues/search"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .search(let coordinates, let radius, let query):
            return [Constants.APIParameterKey.coordinates: coordinates, Constants.APIParameterKey.query: query, Constants.APIParameterKey.radius: radius]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                
            }
        }
        return urlRequest
    }
    
}
