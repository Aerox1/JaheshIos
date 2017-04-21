//
//  MovieData.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/21/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit
import ObjectMapper

class MovieData: Mappable {

    var data: [Movie] = [Movie]()
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        data    <- map["data"]
    }
    
}
