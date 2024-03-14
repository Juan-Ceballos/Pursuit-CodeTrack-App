//
//  UserScoresView.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/12/24.
//

import UIKit


class UserScoresView: UIView {
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var userScoresBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    private func commonInit() {
        
    }
}
