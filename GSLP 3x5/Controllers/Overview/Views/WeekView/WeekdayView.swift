//
//  WeekdayView.swift
//  GSLP 3x5
//
//  Created by Nazar on 26.07.2023.
//
import UIKit

extension WeekView {
    final class WeekdayView: BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(index: Int, name: String) {
            let startOfWeak = Date().startOfWeek
            let currentDay = startOfWeak.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
            
            nameLabel.textColor = isToday ? .white : Resources.Colors.inActive
            dateLabel.textColor = isToday ? .white : Resources.Colors.inActive
            
            nameLabel.text = name.uppercased()
            dateLabel.text = "\(day)"
            
        }
    }
}

extension WeekView.WeekdayView {
    override func addViews() {
        super.addViews()
        
        addSubviews(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    override func configureView() {
        super.configureView()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
    
        nameLabel.font = Resources.Fonts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
