//
//  BaseInfoView.swift
//  GSLP 3x5
//
//  Created by Nazar on 27.07.2023.
//

import UIKit

final class BaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.textColor = R.Colors.inActive
        return label
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = R.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, alignment: NSTextAlignment = .left) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
    }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        
        setupViews(contentView, titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
      
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor, constant: titleLabel.text == nil ? 0 : 10),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

