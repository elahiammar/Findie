//
//  APIClient.swift
//  Findie
//
//  Created by elahiammar on 22/02/2018.
//  Copyright © 2018 elahiammar. All rights reserved.
//

import Alamofire

class APIClient {
    
    private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping(Result<T>) -> Void) -> DataRequest {
        return Alamofire.request(route)
            .responseJSONDecodable(decoder: decoder){ (response: DataResponse<T>) in
            completion(response.result)
        }
    }
    
    static func location(name: String, latLong: String, completion:@escaping (Result<[Venues]>)->Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .custom({ (<#[CodingKey]#>) -> CodingKey in
            return 
        })
        performRequest(route: APIRouter.search(coordinates: latLong, radius: "1500", query: "gym"), completion: completion)
    }
    
}
