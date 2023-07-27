//
//  BaseView.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc
extension BaseView {
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureView() {
        
    }
}
