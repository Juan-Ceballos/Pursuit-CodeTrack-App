//
//  StandingsModel.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/22/24.
//

import Foundation

struct StandingsModelWrapper: Decodable {
    let StandingsModel: [Standing]
}

struct Standing: Decodable {
    let id: String
    let data: [StandingCoordinate]
}

struct StandingCoordinate: Decodable {
    let x: String
    let y: Int?
}
