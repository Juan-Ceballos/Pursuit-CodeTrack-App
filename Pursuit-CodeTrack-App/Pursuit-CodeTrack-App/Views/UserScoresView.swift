//
//  UserScoresView.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/12/24.
//

import UIKit


class UserScoresView: UIView {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    override func layoutSubviews() {
        scoreboardView.layer.cornerRadius = 10
    }
    
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
    
    var scoreboardTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ScoreBoard"
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    public lazy var scoreboardView: UIView = {
        let view = UIView()
        let sbWidth = width * 0.9
        let sbHeight = sbWidth * 0.5
        view.frame = CGRect(x: 0, y: 0, width: sbWidth, height: sbHeight)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    public lazy var scoreboardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weeklyStackView, monthlyStackView, alltimeStackView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public lazy var weeklyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemRed
        //stackView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return stackView
    }()
    
    public lazy var monthlyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemPurple
        //stackView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return stackView
    }()
    
    public lazy var alltimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemGreen
        //stackView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return stackView
    }()
    
    private func commonInit() {
        pinVCBackground(of: userScoresBackgroundView)
        setupScoreboardViewConstraints()
        setupScoreboardTitleLabelConstraints()
        setupWeeklyStackViewConstraints()
        setupMonthlyStackViewConstraints()
        setupAllTimeStackViewConstraints()
        setupScoreboardStackViewConstraints()
        
    }
    
    private func setupScoreboardViewConstraints() {
        addSubview(scoreboardView)
        scoreboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreboardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreboardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            scoreboardView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            scoreboardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupScoreboardTitleLabelConstraints() {
        addSubview(scoreboardTitleLabel)
        scoreboardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreboardTitleLabel.leadingAnchor.constraint(equalTo: scoreboardView.leadingAnchor, constant: AppSizes.minPadding),
            scoreboardTitleLabel.trailingAnchor.constraint(equalTo: scoreboardView.trailingAnchor, constant: -AppSizes.minPadding),
            scoreboardTitleLabel.centerXAnchor.constraint(equalTo: scoreboardView.centerXAnchor),
            scoreboardTitleLabel.topAnchor.constraint(equalTo: scoreboardView.topAnchor, constant: AppSizes.minPadding)
        ])
    }
    
    private func setupScoreboardStackViewConstraints() {
        scoreboardView.addSubview(scoreboardStackView)
        scoreboardStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreboardStackView.topAnchor.constraint(equalTo: scoreboardTitleLabel.bottomAnchor, constant: AppSizes.minPadding),
            scoreboardStackView.heightAnchor.constraint(equalTo: scoreboardView.heightAnchor, multiplier: 0.8),
            scoreboardStackView.widthAnchor.constraint(equalTo: scoreboardView.widthAnchor)
        ])
    }
    
    private func setupWeeklyStackViewConstraints() {
        addSubview(weeklyStackView)
        weeklyStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeklyStackView.heightAnchor.constraint(equalToConstant: 50)
            //weeklyStackView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupMonthlyStackViewConstraints() {
        addSubview(monthlyStackView)
        monthlyStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthlyStackView.heightAnchor.constraint(equalToConstant: 50)
            //monthlyStackView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupAllTimeStackViewConstraints() {
        addSubview(alltimeStackView)
        alltimeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alltimeStackView.heightAnchor.constraint(equalToConstant: 50)
            //lltimeStackView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
