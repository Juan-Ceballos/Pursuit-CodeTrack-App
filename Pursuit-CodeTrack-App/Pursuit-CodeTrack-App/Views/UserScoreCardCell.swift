//
//  UserScoreCardCell.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/29/24.
//

import UIKit

class UserScoreCardCell: UICollectionViewCell {
    static let reuseId = "cardCell"
    
    let cardView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .systemGreen
        return uiview
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCardViewConstraints()
        setupNameLabelConstraints()
    }
    
    private func setupCardViewConstraints() {
        addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            //cardView.widthAnchor.constraint(equalToConstant: 20),
            //cardView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupNameLabelConstraints() {
        cardView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
