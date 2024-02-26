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
    
    enum CodingKeys: String, CodingKey {
        case id
        case fellowsThisWeek = "fellows_this_week"
        case fellowsThisMonth = "fellows_this_month"
        case fellowsAllTime = "fellows_all_time"
        case staffAllTime = "staff_all_time"
        case organization
    }
}
