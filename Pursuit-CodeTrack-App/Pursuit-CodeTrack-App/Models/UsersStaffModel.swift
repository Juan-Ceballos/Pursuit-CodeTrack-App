//
//  UsersStaff.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/25/24.
//

import Foundation

struct UsersStaffModel: Decodable {
    let users: [UserStaff]
}

struct UserStaff: Decodable {
    let id: Int
    let name: String
    let role: String
    let totalScore: Int
}
