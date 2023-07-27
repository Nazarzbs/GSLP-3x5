//
//  BaseController.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}


class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        setupViews()
        constraintViews()
    }
}

@objc
extension BaseController {
    
    func setupViews() {
        
    }
    
    func constraintViews() {
        
    }
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("Left Tapped")
    }
    
    func navBarRightButtonHandler() {
        print("Right Tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String ) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.titleLabel?.font = R.Fonts.helvelticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
