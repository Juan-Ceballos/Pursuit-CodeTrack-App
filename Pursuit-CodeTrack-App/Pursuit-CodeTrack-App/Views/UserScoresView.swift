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
        let stackView = UIStackView(arrangedSubviews: [weeklyView, monthlyView, alltimeView])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public lazy var weeklyView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemRed
        return stackView
    }()
    
    public lazy var monthlyView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemPurple
        return stackView
    }()
    
    public lazy var alltimeView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.backgroundColor = .systemGreen
        return stackView
    }()
    
    private func commonInit() {
        pinVCBackground(of: userScoresBackgroundView)
        setupScoreboardViewConstraints()
        setupScoreboardTitleLabelConstraints()
        setupScoreboardStackViewConstraints()
        setupWeeklyViewConstraints()
        setupMonthlyViewConstraints()
        setupAllTimeViewConstraints()
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
    
    private func setupWeeklyViewConstraints() {
        scoreboardStackView.addSubview(weeklyView)
        weeklyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeklyView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9),
            weeklyView.widthAnchor.constraint(equalTo: <#T##NSLayoutDimension#>, multiplier: <#T##CGFloat#>)
            //weeklyStackView.leadingAnchor.constraint(equalTo: scoreboardStackView.leadingAnchor, constant: AppSizes.minPadding)
        ])
    }
    
    private func setupMonthlyViewConstraints() {
        scoreboardStackView.addSubview(monthlyView)
        monthlyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthlyView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9),
        ])
    }
    
    private func setupAllTimeViewConstraints() {
        scoreboardStackView.addSubview(alltimeView)
        alltimeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alltimeView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9),
        ])
    }
    
}
