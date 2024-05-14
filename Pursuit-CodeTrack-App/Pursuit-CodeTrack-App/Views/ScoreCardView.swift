//
//  UserScoresView.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 3/12/24.
//

import UIKit

class ScoreCardView: UIView {
    
    override func layoutSubviews() {
        scoreBoardView.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    var scoreCardViewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    var scoreBoardTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ScoreBoard"
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    public lazy var scoreBoardView: UIView = {
        let view = UIView()
        let scoreBoardViewWidth = AppSizes.screenWidth * 0.9
        let scoreBoardViewHeight = scoreBoardViewWidth * 0.5
        view.frame = CGRect(x: 0, y: 0, width: scoreBoardViewWidth, height: scoreBoardViewHeight)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    public lazy var scoreboardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weeklyStackView, monthlyStackView, alltimeStackView])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    public lazy var weeklyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weeklyLabel, weeklyFellowsLabel, weeklyFellowsNumberLabel, weeklyStaffLabel, weeklyStaffNumberLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
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
        label.text = "Fellows:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        return label
    }()
    
    public lazy var weeklyFellowsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    public lazy var weeklyStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var weeklyStaffNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    public lazy var monthlyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [monthlyLabel, monthlyFellowsLabel, monthlyFellowsNumberLabel, monthlyStaffLabel, monthlyStaffNumberLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
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
        label.text = "Fellows:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var monthlyFellowsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    public lazy var monthlyStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var monthlyStaffNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    public lazy var alltimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [alltimeLabel, alltimeFellowsLabel, alltimeFellowsNumberLabel, alltimeStaffLabel, alltimeStaffNumberLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
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
        label.text = "Fellows:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var alltimeFellowsNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    public lazy var alltimeStaffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff:"
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.subHeaderTextFont
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var alltimeStaffNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColors.primaryTextColor
        label.font = AppFonts.normalNumberFont
        return label
    }()
    
    func configure(scoreboardModel: ScoreboardModel) {
        weeklyFellowsNumberLabel.text? = String(scoreboardModel.fellowsThisWeek)
        weeklyStaffNumberLabel.text? = String(scoreboardModel.staffThisWeek)
        monthlyFellowsNumberLabel.text? = String(scoreboardModel.fellowsThisMonth)
        monthlyStaffNumberLabel.text? = String(scoreboardModel.staffThisMonth)
        alltimeFellowsNumberLabel.text? = String(scoreboardModel.fellowsAllTime)
        alltimeStaffNumberLabel.text? = String(scoreboardModel.staffAllTime)
    }
    
    public lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemPink
        cv.register(UserScoreCardCell.self, forCellWithReuseIdentifier: UserScoreCardCell.reuseId)
        return cv
    }()
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .fractionalHeight(0.33))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
           
        let section = NSCollectionLayoutSection(group: group)
        //let sec2 = NSCollectionLayoutSection(
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func commonInit() {
        pinVCBackground(of: scoreCardViewBackground)
        setupScoreboardViewConstraints()
        setupScoreboardTitleLabelConstraints()
        setupScoreboardStackViewConstraints()
        setupWeeklyViewConstraints()
        setupMonthlyViewConstraints()
        setupAllTimeViewConstraints()
        setupCollectionViewConstraints()
    }
    
    func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: scoreBoardView.bottomAnchor, constant: AppSizes.minPadding),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupScoreboardViewConstraints() {
        addSubview(scoreBoardView)
        scoreBoardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreBoardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreBoardView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            scoreBoardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scoreBoardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95)
        ])
    }
    
    private func setupScoreboardTitleLabelConstraints() {
        addSubview(scoreBoardTitleLabel)
        scoreBoardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreBoardTitleLabel.leadingAnchor.constraint(equalTo: scoreBoardView.leadingAnchor, constant: AppSizes.minPadding),
            scoreBoardTitleLabel.trailingAnchor.constraint(equalTo: scoreBoardView.trailingAnchor, constant: -AppSizes.minPadding),
            scoreBoardTitleLabel.centerXAnchor.constraint(equalTo: scoreBoardView.centerXAnchor),
            scoreBoardTitleLabel.topAnchor.constraint(equalTo: scoreBoardView.topAnchor, constant: AppSizes.minPadding)
        ])
    }
    
    private func setupScoreboardStackViewConstraints() {
        scoreBoardView.addSubview(scoreboardStackView)
        scoreboardStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreboardStackView.topAnchor.constraint(equalTo: scoreBoardTitleLabel.bottomAnchor, constant: AppSizes.minPadding),
            scoreboardStackView.heightAnchor.constraint(equalTo: scoreBoardView.heightAnchor, multiplier: 0.95),
            scoreboardStackView.widthAnchor.constraint(equalTo: scoreBoardView.widthAnchor)
        ])
    }
    
    private func setupWeeklyViewConstraints() {
        scoreboardStackView.addSubview(weeklyStackView)
        weeklyStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeklyStackView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.7),
            weeklyStackView.leadingAnchor.constraint(equalTo: scoreboardStackView.leadingAnchor)
        ])
    }
    
    private func setupMonthlyViewConstraints() {
        scoreboardStackView.addSubview(monthlyStackView)
        monthlyStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthlyStackView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func setupAllTimeViewConstraints() {
        scoreboardStackView.addSubview(alltimeStackView)
        alltimeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alltimeStackView.heightAnchor.constraint(equalTo: scoreboardStackView.heightAnchor, multiplier: 0.7)
        ])
    }
    
}
