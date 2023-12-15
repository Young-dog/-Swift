//
//  Groups.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 15.12.2023.
//

import Foundation

struct GroupsResult : Decodable {
    let response : Groups
}

struct Groups : Decodable {
    let items : [Group]
}

struct Group : Decodable {
    let id : Int
    let name : String
    let description : String
}
