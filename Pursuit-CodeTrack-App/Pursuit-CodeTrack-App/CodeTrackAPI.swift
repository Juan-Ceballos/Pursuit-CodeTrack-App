//
//  CodeTrackAPI.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/20/24.
//

import Foundation

class CodeTrackAPI {
    func fetchScoreboard() async throws -> ScoreboardModel {
        let url = URL(string: CodeTrackURL.scoreboard)!
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(ScoreboardModel.self, from: data)
    }
}
