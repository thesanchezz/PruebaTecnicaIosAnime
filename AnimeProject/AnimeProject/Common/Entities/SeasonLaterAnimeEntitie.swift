//
//  SeasonLaterAnimeEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 10/10/21.
//

import ObjectMapper

struct SeasonLaterAnimeEntitie: Mappable {
    var mal_id: Int?
    var title: String?
    var url: String?
    var image_url: String?
    var synopsis: String?
    var type: String?
    var episodes: Int?
    var members: Int?
    var score: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        mal_id <- map["mal_id"]
        title <- map["title"]
        url <- map["url"]
        image_url <- map["image_url"]
        synopsis <- map["synopsis"]
        type <- map["type"]
        episodes <- map["episodes"]
        members <- map["members"]
        score <- map["score"]
    }
}

