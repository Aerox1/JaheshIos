//
//  Movie.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/20/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    
    var id: Int = 0
    var title: String = ""
    var poster: String = ""
    var genre: [String] = [String]()

    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        title       <- map["title"]
        poster      <- map["poster"]
        genre       <- map["genre"]
    }
}
