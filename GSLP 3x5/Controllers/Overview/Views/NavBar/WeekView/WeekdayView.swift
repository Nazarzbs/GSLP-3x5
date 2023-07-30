//
//  WeekdayView.swift
//  GSLP 3x5
//
//  Created by Nazar on 26.07.2023.
//
import UIKit

extension WeekView {
    final class WeekdayView: GSBaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(index: Int, name: String) {
            let startOfWeak = Date().startOfWeek
            let currentDay = startOfWeak.agoForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? R.Colors.active : R.Colors.background
            
            nameLabel.textColor = isToday ? .white : R.Colors.inActive
            dateLabel.textColor = isToday ? .white : R.Colors.inActive
            
            nameLabel.text = name.uppercased()
            dateLabel.text = "\(day)"
            
        }
    }
}

extension WeekView.WeekdayView {
    override func setupViews() {
        super.setupViews()
        
        setupViews(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
    
        nameLabel.font = R.Fonts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = R.Fonts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
