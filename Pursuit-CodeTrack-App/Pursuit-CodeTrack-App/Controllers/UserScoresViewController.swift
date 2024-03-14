//
//  ViewController.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 1/30/24.
//

import UIKit

class UserScoresViewController: UIViewController {
    
    let userScoreView = UserScoresView()
    
    override func loadView() {
        view = userScoreView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

