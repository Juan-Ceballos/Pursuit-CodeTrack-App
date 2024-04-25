//
//  ViewController.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 1/30/24.
//

import UIKit

class UserScoresViewController: UIViewController {
    
    let userScoreView = UserScoresView()
    var scoreboard: ScoreboardModel?
    var users = ["Leaders": [User](), "Fellows": [User](), "Staff": [User]()]
    
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
            userScoreView.configure(scoreboardModel: scoreboard!)
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
        // 2d arr of items?
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section  {
        case 0: return 0
        case 1: return users["Fellows"]?.count ?? 0
        case 2: return users["Staff"]?.count ?? 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserScoreCardCell.reuseId, for: indexPath) as? UserScoreCardCell else {
            fatalError()
        }
                
        switch indexPath.section {
        case 0:
            let leaderItem = users["Leaders"]?[indexPath.row]
        case 1: 
            let fellowItem = users["Fellows"]?[indexPath.row]
            cell.nameLabel.text = fellowItem?.name
        case 2: 
            let staffItem = users["Staff"]?[indexPath.row]
            cell.nameLabel.text = staffItem?.name
        default: print()
        }
        
        cell.backgroundColor = .systemBlue
        
        return cell
    }
    
    
}

