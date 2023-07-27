//
//  SecondaryButton.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitle(_ title: String) {
        label.text = title
    }

}

private extension SecondaryButton {
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func configure() {
        backgroundColor = R.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = R.Colors.active
        label.textAlignment = .center
        label.font = R.Fonts.helvelticaRegular(with: 15)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = R.Colors.active
    }
}
