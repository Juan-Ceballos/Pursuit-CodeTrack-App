//
//  Pursuit_CodeTrack_AppTests.swift
//  Pursuit-CodeTrack-AppTests
//
//  Created by Juan ceballos on 1/30/24.
//

import XCTest
@testable import Pursuit_CodeTrack_App

final class Pursuit_CodeTrack_AppTests: XCTestCase {
    
    let codeTrackAPI = CodeTrackAPI()
    
    func testFecthOrgPursuitData() async {
        let exp = XCTestExpectation(description: "Org Pursuit Data Fetched")
        let baseURLOrgPursuitStr = CodeTrackURL.orgPursuit
        let expectationDataCount = 100
        
        Task {
            do {
                let url = URL(string: baseURLOrgPursuitStr)!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectationDataCount, "Count of data fetched \(data.count) is greater that minimum data count of \(expectationDataCount)")
                exp.fulfill()
            } catch {
               XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testFetchScoreboardData() async {
        let exp = XCTestExpectation(description: "Scoreboard data fetched")
        let baseURLScoreboardStr = CodeTrackURL.scoreboard
        let expectationDataCount = 150
        
        Task {
            do {
                let url = URL(string: baseURLScoreboardStr)!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectationDataCount, "Count of data fetched \(data.count) is greater that minimum data count of \(expectationDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }
    
    func parseScoreboardDataModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        Task {
            do {
                let scoreBoardModel = try await codeTrackAPI.fetchScoreboard()
                // try grabbing model prop
            } catch {
                
            }
        }
        
    }

}
