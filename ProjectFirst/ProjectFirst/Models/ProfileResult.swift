//
//  ProfileResult.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation

struct ProfileResult : Decodable {
    let response : [Profile]
}

struct Profile : Decodable {
    let id : Int
    let photo : String
    let firstName : String
    let lastName : String
    
    enum CodingKeys : String, CodingKey {
        case id
        case photo
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
