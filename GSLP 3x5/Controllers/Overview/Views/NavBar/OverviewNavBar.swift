//
//  OverviewNavBar.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

final class OverviewNavBar: GSBaseView {
    
    private let allWorkoutsButton: GSButton = {
        let allWorkoutsButton = GSButton(with: .secondary)
        allWorkoutsButton.setTitle(R.Strings.Overview.allWorkoutsButton)
        return allWorkoutsButton
    }()

    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(R.Images.Common.add, for: .normal)
        return addButton
    }()
    
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.text = R.Strings.NavBar.overview
        titleLabel.font = R.Fonts.helvelticaRegular(with: 22)
        titleLabel.textColor = R.Colors.titleGray
        return titleLabel
    }()
    
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addButtonAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        setupViews(allWorkoutsButton, addButton, titleLabel, weekView)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
      
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
}


