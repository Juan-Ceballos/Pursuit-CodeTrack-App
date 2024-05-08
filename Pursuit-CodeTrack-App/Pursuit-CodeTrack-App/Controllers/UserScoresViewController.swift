//
//  ViewController.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 1/30/24.
//

import UIKit

class UserScoresViewController: UIViewController {
    
    let userScoreView = ScoreCardView()
    var scoreboard: ScoreboardModel?
    var users = ["Leaders": [User](), "Fellows": [User](), "Staff": [User]()]
    var usersGrouped = [[User]]()
    
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
    
    func fetchUsers() async -> [[User]]? {
        do {
            let userFellows: UsersModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.users)
            let userStaff: UsersModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.role)
            let fellowsByPoints = userFellows.users.sorted {$0.totalScore > $1.totalScore}
            let staffByPoints = userStaff.users.sorted {$0.totalScore > $1.totalScore}
            return [fellowsByPoints, staffByPoints]
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    
    func setUsers() {
        Task {
            //await users = fetchUsers()
            if let allUsers = await fetchUsers() {
                users["Fellows"] = allUsers[0]
                users["Staff"] = allUsers[1]
                usersGrouped = users["Fellows"]?.chunked(chunkSize: 3) ?? [[User]]()
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
        return usersGrouped.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usersGrouped[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserScoreCardCell.reuseId, for: indexPath) as? UserScoreCardCell else {
            fatalError()
        }
        
        //let fellowItem = users["Fellows"]?[indexPath.row]
        let fellowItem = usersGrouped[indexPath.section][indexPath.row]
        cell.nameLabel.text = fellowItem.name
        
        cell.backgroundColor = .systemBlue
        
        return cell
    }
    
}
