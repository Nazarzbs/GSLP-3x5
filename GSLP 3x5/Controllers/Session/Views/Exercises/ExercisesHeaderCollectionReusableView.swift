//
//  ExercisesHeaderCollectionReusableView.swift
//  GSLP 3x5
//
//  Created by Nazar on 05.08.2023.
//

import UIKit

class ExercisesHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ExercisesHeaderCollectionReusableView"
    
    let setLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = R.Fonts.helvelticaRegular(with: 14)
        label.textAlignment = .center
        label.text = "SET"
        label.textColor = .secondaryLabel.withAlphaComponent(0.5)
        return label
    }()
    
    let prevLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = R.Fonts.helvelticaRegular(with: 14)
        label.textAlignment = .center
        label.text = "PREV"
        label.textColor = .secondaryLabel.withAlphaComponent(0.5)
        return label
    }()
    
    let repLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = R.Fonts.helvelticaRegular(with: 14)
        label.textAlignment = .center
        label.text = "REP"
        label.textColor = .secondaryLabel.withAlphaComponent(0.5)
        return label
    }()
    
    let kgLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = R.Fonts.helvelticaRegular(with: 14)
        label.text = "KG"
        label.textColor = .secondaryLabel.withAlphaComponent(0.5)
        return label
    }()
    
    let checkLabel: UILabel = {
        
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "✓"
        label.textAlignment = .center
        label.textColor = .secondaryLabel.withAlphaComponent(0.5)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(setLabel, prevLabel, repLabel, kgLabel, checkLabel)
        backgroundColor = R.Colors.background
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            setLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
          
            setLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            setLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            setLabel.widthAnchor.constraint(equalToConstant: 30),
            
            prevLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            prevLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            prevLabel.trailingAnchor.constraint(equalTo: repLabel.leadingAnchor, constant: -10),
            prevLabel.widthAnchor.constraint(equalToConstant: 80),
            
            repLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            repLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            repLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            repLabel.widthAnchor.constraint(equalToConstant: 80),
            
            kgLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            kgLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            kgLabel.leadingAnchor.constraint(equalTo: repLabel.trailingAnchor, constant: 10),
            kgLabel.widthAnchor.constraint(equalToConstant:  80),
            
            checkLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
           
            checkLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setTitle(_ title: String) {
//        label.text = title
//    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
    }
}

