//
//  CellEntitie.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import ObjectMapper

struct CellEntitie: Mappable {
    var id: String?
    var slug: String?
    var data: Any?
    var indexExtra: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        slug <- map["slug"]
        data <- map["data"]
        indexExtra <- map["indexExtra"]
    }
}
