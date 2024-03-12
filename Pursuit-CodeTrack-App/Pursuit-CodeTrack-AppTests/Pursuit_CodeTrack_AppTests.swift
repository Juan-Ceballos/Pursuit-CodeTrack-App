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
    
    // Update this test each time there's an added standing
    func testFetchStandingsModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        //let expectedStandingCount = 18
        let expectedFirstXValue = "Monday"
        let codeTrackAPI = CodeTrackAPI<[StandingsModel]>()
        Task {
            do {
                let standingsModelsWrapper = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.standings)
                let standings = standingsModelsWrapper
                let x = standings.first?.data
                XCTAssertEqual("expectedFirstXValue", "standingsCount", "expected int \(expectedFirstXValue) to equal int from model \("standingsCount")")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }

    func testFetchUsersModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedUserRole = "fellow"
        let codeTrackAPI = CodeTrackAPI<UsersModel>()
        Task {
            do {
                let usersModel = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.users)
                let users = usersModel.users
                if let userRole = users.first?.role {
                    XCTAssertEqual(expectedUserRole, userRole, "expected string \(expectedUserRole) to equal string from model \(userRole)")
                    exp.fulfill()
                } else {XCTFail("Found nil when accessing first user in users array for model") }
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }
    
    func testFetchUsersStaffModel() async {
        let exp = XCTestExpectation(description: "Parsed scoreboard data to model")
        let expectedUserStaffRole = "staff"
        let codeTrackAPI = CodeTrackAPI<UsersStaffModel>()
        Task {
            do {
                let usersStaffModel = try await codeTrackAPI.fetchCodeTrack(CodeTrackURL.role)
                let usersStaff = usersStaffModel.users
                if let usersStaffRole = usersStaffModel.users.first?.role {
                    XCTAssertEqual(expectedUserStaffRole, usersStaffRole, "expected string \(expectedUserStaffRole) to equal string from model \(usersStaffRole)")
                    exp.fulfill()
                } else {XCTFail("Found nil when accessing first user in users array for model")}
                
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10)
    }

    

}
