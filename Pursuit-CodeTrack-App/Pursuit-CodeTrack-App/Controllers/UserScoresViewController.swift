//
//  ViewController.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 1/30/24.
//

import UIKit

enum SectionType: String {
    case leaders = "leader"
    case fellows = "fellow"
    case staff = "staff"
    case allSections = "allSections"
}

class UserScoresViewController: UIViewController {
    
    let userScoreView = ScoreCardView()
    var scoreboard: ScoreboardModel?
    var users = [SectionType.leaders: [[User]](), SectionType.fellows: [[User]](), SectionType.staff: [[User]](), SectionType.allSections: [[User]]()]
    
    init(scoreboard: ScoreboardModel? = nil) {
        self.scoreboard = scoreboard
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userScoreView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setScoreboardModel()
        setUsers()
        userScoreView.collectionView.dataSource = self
    }
    
    func fetchScoreboardData() async -> ScoreboardModel? {
        do {
            let scoreboard: ScoreboardModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.scoreboard)
            return scoreboard
        } catch {
            print("\(error)")
        }
        return nil
    }
    
    func setScoreboardModel() {
        Task {
            await scoreboard = fetchScoreboardData()
            userScoreView.configure(scoreboardModel: scoreboard ?? ScoreboardModel(id: 0, fellowsThisWeek: 0, fellowsThisMonth: 0, staffThisWeek: 0, staffThisMonth: 0, fellowsAllTime: 0, staffAllTime: 0, organization: ""))
        }
    }
    
    func fetchUsers() async -> (fellows: [User], staff: [User])? {
        do {
            let userFellows: UsersModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.users)
            let userStaff: UsersModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.role)
            let fellowsByPoints = userFellows.users.sorted {$0.totalScore > $1.totalScore}
            let staffByPoints = userStaff.users.sorted {$0.totalScore > $1.totalScore}
            return (fellowsByPoints, staffByPoints)
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    
    func setUsers() {
        Task {
            if let allUsers = await fetchUsers() {
                let leaders = Array(allUsers.fellows.prefix(3)).chunked(chunkSize: 3)
                let fellows = allUsers.fellows.chunked(chunkSize: 3)
                let staff = allUsers.staff.chunked(chunkSize: 3)
                users[SectionType.leaders] = leaders
                users[SectionType.fellows] = fellows
                users[SectionType.staff] = staff
                users[SectionType.allSections] = leaders + fellows + staff
            } else {
               print("error")
            }
            DispatchQueue.main.async {
                self.userScoreView.collectionView.reloadData()
            }
        }
    }
    
}

extension UserScoresViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let allUserSections = users[SectionType.allSections]
        
        return allUserSections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let allUserSections = users[SectionType.allSections]

        return allUserSections?[section].count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserScoreCardCell.reuseId, for: indexPath) as? UserScoreCardCell else {
            fatalError()
        }
        
        //let fellowItem = users["Fellows"]?[indexPath.row]
        //let fellowItem = usersGrouped[indexPath.section][indexPath.row]
        //cell.nameLabel.text = fellowItem.name
        cell.nameLabel.text = "Testing"
        
        cell.backgroundColor = .systemBlue
        
        let a = indexPath.item
        let b = indexPath.section
        
        return cell
    }
    
}
