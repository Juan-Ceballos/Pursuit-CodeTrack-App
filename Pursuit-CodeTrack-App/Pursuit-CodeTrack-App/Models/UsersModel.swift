//
//  Users.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/25/24.
//

import Foundation

struct UsersModel: Decodable {
    let users: [User]
}

struct User: Decodable {
    let id: Int
    let name: String
    let role: String
    let totalScore: Int
}
