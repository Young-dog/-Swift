//
//  ProfilePhotos.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation

struct ProfilePhotosResult : Decodable {
    let response : ProfilePhotos
}

struct ProfilePhotos : Decodable {
    let items : [ProfilePhoto]
}

struct ProfilePhoto : Decodable {
    let id : Int
    let sizes : [Size]
    
    enum CodingKeys : String, CodingKey {
        case id
        case sizes
    }

}

struct Size : Decodable {
    let url : String
}

