//
//  Router.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case popularity
    
    private var baseURL: String {
        return "https://api.jikan.moe/v3"
    }
    
    var method: HTTPMethod {
        switch self {
        case .popularity:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .popularity:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .popularity:
            let url = URL(string: "\(baseURL)/top/anime/1/bypopularity")!
            return url
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
