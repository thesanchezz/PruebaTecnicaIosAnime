//
//  AnimeRepository.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import Foundation
import ObjectMapper

final class AnimeRepository {
    static let shared: AnimeRepository = {
        let instance = AnimeRepository()
        return instance
    }()
    
    func getPopularityList(completion: @escaping (Result<[PopularAnimeEntitie], Error>) -> Void) {
        Network.shared.request(Router.popularity) { result in
            switch result {
            case .success(let data):
                if let dataEntitie = data as? [String: Any],
                   let response = ResponsePopularAnimeEntitie(JSON: dataEntitie),
                   let popularityList = Mapper<PopularAnimeEntitie>().mapArray(JSONObject: response.top?.toJSON()) {
                    completion(.success(popularityList))
                }//validate
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
