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
    case detaild(id: Int)
    case seasonLater
    case search(text: String)
    
    private var baseURL: String {
        return "https://api.jikan.moe/v3"
    }
    
    var method: HTTPMethod {
        switch self {
        case .popularity, .detaild, .seasonLater, .search:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .popularity, .detaild, .seasonLater, .search:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .popularity:
            let url = URL(string: "\(baseURL)/top/anime/1/bypopularity")!
            return url
        case .detaild(let id):
            let url = URL(string: "\(baseURL)/anime/\(id)")!
            return url
        case .seasonLater:
            let url = URL(string: "\(baseURL)/season/later")!
            return url
        case .search(let text):
            let url = "\(baseURL)/search/anime?q=\(text)&order_by=start_date"
            let escapedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let urlComplete = URL(string: escapedString)!
            return urlComplete
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
