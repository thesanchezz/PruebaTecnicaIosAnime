//
//  Network.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit
import Alamofire
import ObjectMapper

final class Network {
    
    static let shared: Network = {
        let instance = Network()
        return instance
    }()

    func request(_ request: URLRequestConvertible, completion: @escaping (Result<Any, Error>) -> Void) {
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
