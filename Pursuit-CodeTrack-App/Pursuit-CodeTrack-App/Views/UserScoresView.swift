//
//  UserScoresView.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/12/24.
//

import UIKit


class UserScoresView: UIView {
    
    // 66, 66, 234, rgb
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    var userScoresBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private func commonInit() {
       pinVCBackground(of: userScoresBackgroundView)
    }
}
