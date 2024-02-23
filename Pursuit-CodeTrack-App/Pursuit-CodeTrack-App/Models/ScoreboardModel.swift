//
//  Scoreboard.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/20/24.
//

import Foundation

struct ScoreboardModel: Decodable {
    let id: Int
    let fellowsThisWeek: Int
    let fellowsThisMonth: Int
    let fellowsAllTime: Int
    let staffAllTime: Int
    let organization: String
}
