//
//  SecondaryButton.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

public enum GSButtonType {
    case primary
    case secondary
}

final class GSButton: UIButton {
    
    private var type: GSButtonType = .primary
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
       
        return iconView
    }()
    
    init(with type: GSButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        constraintViews()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension GSButton {
    func setupViews() {
        setupViews(label, iconView)
    }
    
    func constraintViews() {
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: 0
            case .secondary: 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2.0)
        ])
    }
    
    func configureAppearance() {
        switch type {
        case .primary:
            label.textColor = R.Colors.inActive
            iconView.tintColor = R.Colors.inActive
            label.font = R.Fonts.helvelticaRegular(with: 13)
        case .secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            label.textColor = R.Colors.active
            iconView.tintColor = R.Colors.active
            label.font = R.Fonts.helvelticaRegular(with: 15)
        }
      
        makeSystem(self)
    }
}
