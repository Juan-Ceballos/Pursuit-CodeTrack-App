//
//  CodeTrackAPI.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 2/20/24.
//

import Foundation

class CodeTrackAPI<T: Decodable> {
    func fetchCodeTrack(_ urlStr: String) async throws -> T {
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
