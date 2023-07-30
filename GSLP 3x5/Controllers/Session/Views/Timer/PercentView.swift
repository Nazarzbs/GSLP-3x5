//
//  PercentView.swift
//  GSLP 3x5
//
//  Created by Nazar on 30.07.2023.
//

import UIKit

extension TimerView {
    final class PercentView: GSBaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 23)
            label.textColor = R.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 10)
            label.textColor = R.Colors.inActive
            label.textAlignment = .center
            return label
        }()
    }
}

extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        
        setupViews(stackView)
        
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func configure(with title: String, andValue value: Int) {
        subtitleLabel.text = title
        percentLabel.text = "\(value)%"
    }
}
