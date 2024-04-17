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
    var users: [User]?
    
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
    
    func fetchUsers() async -> [User]? {
        do {
            let userFellows: UsersModel = try await CodeTrackAPI.shared.fetchCodeTrack(CodeTrackURL.users)
            return userFellows.users
        } catch {
            print("\(error)")
        }
        
        return nil
    }
    
    func setUsers() {
        Task {
            await users = fetchUsers()
            DispatchQueue.main.async {
                self.userScoreView.collectionView.reloadData()
            }
        }
    }
    
}

extension UserScoresViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 2d arr of items?
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users?.count ?? 0
        // based on each arr in matrix
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserScoreCardCell.reuseId, for: indexPath) as? UserScoreCardCell else {
            fatalError()
        }
        cell.backgroundColor = .systemBlue
        let userItem = users?[indexPath.row]
        cell.nameLabel.text = userItem?.name
        return cell
    }
    
    
}

