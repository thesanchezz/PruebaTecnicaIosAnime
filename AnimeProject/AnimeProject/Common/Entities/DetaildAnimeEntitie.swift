//
//  DetaildAnimeEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 10/10/21.
//

import ObjectMapper

struct DetaildAnimeEntitie: Mappable {
    var mal_id: Int?
    var title: String?
    var image_url: String?
    var synopsis: String?
    var url: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        mal_id <- map["mal_id"]
        title <- map["title"]
        image_url <- map["image_url"]
        synopsis <- map["synopsis"]
        url <- map["url"]
    }
}
