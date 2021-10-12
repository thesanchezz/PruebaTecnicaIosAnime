//
//  TitleSectionEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import ObjectMapper

struct TitleSectionEntitie: Mappable {
    var name: String?
    var color: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        color <- map["color"]
    }
}

