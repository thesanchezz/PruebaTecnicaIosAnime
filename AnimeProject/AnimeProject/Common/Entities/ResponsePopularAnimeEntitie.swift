//
//  ResponsePopularAnimeEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import ObjectMapper

struct ResponsePopularAnimeEntitie: Mappable {
    var top: [PopularAnimeEntitie]?
    var animeSeasonLater: [SeasonLaterAnimeEntitie]?
    var results: [SeasonLaterAnimeEntitie]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        top <- map["top"]
        animeSeasonLater <- map["anime"]
        results <- map["results"]
    }
}
