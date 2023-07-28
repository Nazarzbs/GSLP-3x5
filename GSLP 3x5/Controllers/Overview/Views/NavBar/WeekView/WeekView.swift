//
//  WeekView.swift
//  GSLP 3x5
//
//  Created by Nazar on 26.07.2023.
//

import UIKit

final class WeekView: BaseView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
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
        
        var weekday = Date.calendar.shortStandaloneWeekdaySymbols
        
        if Date.calendar.firstWeekday == 2 {
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
