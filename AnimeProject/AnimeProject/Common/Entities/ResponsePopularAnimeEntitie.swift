//
//  ResponsePopularAnimeEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import ObjectMapper

struct ResponsePopularAnimeEntitie: Mappable {
    var top: [PopularAnimeEntitie]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        top <- map["top"]
    }
}
