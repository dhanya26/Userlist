//
//  UserModel.swift
//  UserLists
//
//  Created by Dhanya Shaju  on 27/04/21.
//  Copyright © 2021 Dhanya Shaju . All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel : Mappable {
    var page : Int?
    var per_page : Int?
    var total : Int?
    var total_pages : Int?
    var data : [UserData]?
    var support : Support?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        page <- map["page"]
        per_page <- map["per_page"]
        total <- map["total"]
        total_pages <- map["total_pages"]
        data <- map["data"]
        support <- map["support"]
    }

}

class UserData : Mappable {
    var id : Int?
    var email : String?
    var first_name : String?
    var last_name : String?
    var avatar : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        id <- map["id"]
        email <- map["email"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        avatar <- map["avatar"]
    }

}

class Support : Mappable {
    var url : String?
    var text : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        url <- map["url"]
        text <- map["text"]
    }

}
