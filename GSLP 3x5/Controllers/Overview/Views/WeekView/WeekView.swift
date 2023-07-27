//
//  WeekView.swift
//  GSLP 3x5
//
//  Created by Nazar on 26.07.2023.
//

import UIKit

final class WeekView: BaseView {
    private let stackView =  UIStackView()
    private let calendar = Calendar.current
    
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        
        setupViews(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekday = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sun = weekday.remove(at: 0)
            weekday.append(sun)
        }
      
        weekday.enumerated().forEach({ index, name in
            let view = WeekdayView()
            view.configure(index: index, name: name)
            stackView.addArrangedSubview(view)
        })
    }
}
