//
//  Friends.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation

struct FriendsResult : Decodable {
    let response : Friends
}

struct Friends : Decodable {
    let items : [Friend]
}

struct Friend : Decodable {
    let id : Int
    let firstName : String
    let lastName : String
    let photo200Orig : String
    let online : Int
    
    enum CodingKeys : String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo200Orig = "photo_200_orig"
        case online
    }

}
