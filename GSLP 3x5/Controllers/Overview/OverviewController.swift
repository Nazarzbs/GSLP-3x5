//
//  ViewController.swift
//  GSLP 3x5
//
//  Created by Nazar on 24.07.2023.
//

import UIKit

class OverviewController: BaseController {
    
    private let allWorkoutsButton = SecondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
        ])
    }
    
    override func configure() {
        super.configure()
        
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
    }
}

@objc
extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All workouts Button tapped")
    }
}
