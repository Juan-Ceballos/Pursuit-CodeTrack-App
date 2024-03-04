//
//  Pursuit_CodeTrack_AppTests.swift
//  Pursuit-CodeTrack-AppTests
//
//  Created by Juan ceballos on 1/30/24.
//

import XCTest
@testable import Pursuit_CodeTrack_App

final class Pursuit_CodeTrack_AppTests: XCTestCase {
    
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
    
    func testFetchScoreboardModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedScoreboardOrganization = "pursuit"
        let codeTrackAPI = CodeTrackAPI<ScoreboardModel>()
        Task {
            do {
                let scoreBoardModel = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.scoreboard)
                let scoreBoardOrganization = scoreBoardModel.organization
                XCTAssertEqual(expectedScoreboardOrganization, scoreBoardOrganization, "expected string \(expectedScoreboardOrganization) to equal string from model \(scoreBoardOrganization)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }
    
    func testFetchStandingsModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedStandingCount = 18
        let codeTrackAPI = CodeTrackAPI<[StandingsModel]>()
        Task {
            do {
                let standingsModelsWrapper = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.standings)
                let standingsCount = standingsModelsWrapper.count
                XCTAssertEqual(expectedStandingCount, standingsCount, "expected int \(expectedStandingCount) to equal int from model \(standingsCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }

    // Update this test each time there's a new cohort
    func testFetchUsersModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedUsersCount = 512
        let codeTrackAPI = CodeTrackAPI<UsersModel>()
        Task {
            do {
                let usersModel = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.users)
                let usersCount = usersModel.users.count
                XCTAssertEqual(expectedUsersCount, usersCount, "expected int \(expectedUsersCount) to equal int from model \(usersCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }
    
    // Update this test when change in staff
    func testFetchUsersStaffModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedUsersStaffCount = 20
        let codeTrackAPI = CodeTrackAPI<UsersStaffModel>()
        Task {
            do {
                let usersStaffModel = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.role)
                let usersStaffCount = usersStaffModel.users.count
                XCTAssertEqual(expectedUsersStaffCount, usersStaffCount, "expected int \(expectedUsersStaffCount) to equal int from model \(usersStaffCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }

    

}
