//
//  PopularAnimeEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import ObjectMapper

struct PopularAnimeEntitie: Mappable {
    var mal_id: Int?
    var rank: Int?
    var title: String?
    var url: String?
    var image_url: String?
    var type: String?
    var episodes: Int?
    var start_date: String?
    var end_date: String?
    var members: Int?
    var score: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        mal_id <- map["mal_id"]
        rank <- map["rank"]
        title <- map["title"]
        url <- map["url"]
        image_url <- map["image_url"]
        type <- map["type"]
        episodes <- map["episodes"]
        start_date <- map["start_date"]
        end_date <- map["end_date"]
        members <- map["members"]
        score <- map["score"]
    }
}

