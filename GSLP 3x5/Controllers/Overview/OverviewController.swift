//
//  ViewController.swift
//  GSLP 3x5
//
//  Created by Nazar on 24.07.2023.
//

import UIKit

class OverviewController: BaseController {
    private let navBar = OverviewNavBar()

}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.setupViews(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
    }
}
