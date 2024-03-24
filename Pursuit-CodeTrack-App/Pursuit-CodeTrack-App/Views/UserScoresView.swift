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
    
    public lazy var weeklyView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weeklyLabel, weeklyFellowsLabel, weeklyStaffLabel])
        //stackView.backgroundColor = .systemRed
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    public lazy var monthlyView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [monthlyLabel, monthlyFellowsLabel, monthlyStaffLabel])
        //stackView.backgroundColor = .systemPurple
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    public lazy var alltimeView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [alltimeLabel, alltimeFellowsLabel, alltimeStaffLabel])
        //stackView.backgroundColor = .systemGreen
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    public lazy var weeklyLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    public lazy var weeklyFellowsLabel: UILabel = {
        let label = UILabel()
        label.text = "Fellows: 2774"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var weeklyStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff: 288"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var monthlyLabel: UILabel = {
        let label = UILabel()
        label.text = "Monthly"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    public lazy var monthlyFellowsLabel: UILabel = {
        let label = UILabel()
        label.text = "Fellows: 12225"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var monthlyStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff: 937"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var alltimeLabel: UILabel = {
        let label = UILabel()
        label.text = "All Time"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    public lazy var alltimeFellowsLabel: UILabel = {
        let label = UILabel()
        label.text = "Fellows: 346441"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var alltimeStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff: 16323"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
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
            weeklyView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9)
        ])
    }
    
    private func setupMonthlyViewConstraints() {
        scoreboardStackView.addSubview(monthlyView)
        monthlyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthlyView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9)
        ])
    }
    
    private func setupAllTimeViewConstraints() {
        scoreboardStackView.addSubview(alltimeView)
        alltimeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alltimeView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.9)
        ])
    }
    
}
