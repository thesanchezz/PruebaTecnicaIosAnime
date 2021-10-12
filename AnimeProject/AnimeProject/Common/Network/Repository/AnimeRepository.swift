//
//  AnimeRepository.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import Foundation
import UIKit
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
                   let popularityList = Mapper<PopularAnimeEntitie>().mapArray(JSONObject: Array(response.top?.toJSON().prefix(10) ?? []) ) {
                    completion(.success(popularityList))
                }else {
                    let serializingError = ErrorApp.serializingData
                    completion(.failure(serializingError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDetaild(id: Int, completion: @escaping (Result<DetaildAnimeEntitie, Error>) -> Void) {
        Network.shared.request(Router.detaild(id: id)) { result in
            switch result {
            case .success(let data):
                if let dataEntitie = data as? [String: Any],
                   let detaild = DetaildAnimeEntitie(JSON: dataEntitie) {
                    completion(.success(detaild))
                }else {
                    let serializingError = ErrorApp.serializingData
                    completion(.failure(serializingError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSeasonLater(completion: @escaping (Result<[SeasonLaterAnimeEntitie], Error>) -> Void) {
        Network.shared.request(Router.seasonLater) { result in
            switch result {
            case .success(let data):
                if let dataEntitie = data as? [String: Any],
                   let response = ResponsePopularAnimeEntitie(JSON: dataEntitie),
                   let popularityList = Mapper<SeasonLaterAnimeEntitie>().mapArray(JSONObject: response.animeSeasonLater?.toJSON() ?? [] ) {
                    completion(.success(popularityList))
                }else {
                    let serializingError = ErrorApp.serializingData
                    completion(.failure(serializingError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSearch(search: String, completion: @escaping (Result<[SeasonLaterAnimeEntitie], Error>) -> Void) {
        Network.shared.request(Router.search(text: search)) { result in
            switch result {
            case .success(let data):
                if let dataEntitie = data as? [String: Any],
                   let response = ResponsePopularAnimeEntitie(JSON: dataEntitie),
                   let popularityList = Mapper<SeasonLaterAnimeEntitie>().mapArray(JSONObject: response.results?.toJSON() ?? [] ) {
                    completion(.success(popularityList))
                }else {
                    let serializingError = ErrorApp.serializingData
                    completion(.failure(serializingError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
