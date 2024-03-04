//
//  MainTabBarController.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/3/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    public lazy var userScoresViewController: UIViewController =  {
        let vc = UserScoresViewController()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 0)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: userScoresViewController)]
    }
}
