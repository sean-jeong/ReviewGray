//
//  Post.swift
//  ReviewGrayGram
//
//  Created by Sunny Jeong on 2017. 6. 18..
//  Copyright © 2017년 Sunny Jeong. All rights reserved.
//

import ObjectMapper


struct Post: Mappable {

    var id: Int!
    var user: User!
    var photoID: String!
    var message: String?
    var isLiked: Bool!
    var likeCount: Int!
    var createdAt: Date!
    
    
    init?(map: Map) {
        // check validation : map is nil ??
        // 거의 사용할 경우 없음.
    }

    
    mutating func mapping(map: Map) {
        id <- map["id"]
        user <- map["user"]
        photoID <- map["photo.id"]
        message <- map["message"]
        isLiked <- map["is_liked"]
        likeCount <- map["like_count"]
        createdAt <- (map["created_at"], ISO8601DateTransform())
    }
    
}
