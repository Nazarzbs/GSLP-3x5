//
//  BaseView.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

class GSBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureAppearance()
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc
extension GSBaseView {
    func setupViews() {
        
    }
    
    func configureAppearance() {
        backgroundColor = .white
    }
    
    func constraintViews() {
        
    }
}
