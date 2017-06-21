//
//  User.swift
//  ReviewGrayGram
//
//  Created by Sunny Jeong on 2017. 6. 18..
//  Copyright © 2017년 Sunny Jeong. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
    
    var id: Int!
    var userName: String!
    var photoID: String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        userName <- map["username"]
        photoID <- map["photo.id"]
    }
    
}
