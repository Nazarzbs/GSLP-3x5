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
        
        configure()
    }
}

@objc
extension BaseController {
    
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configure() {
        view.backgroundColor = Resources.Colors.background
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
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.titleLabel?.font = Resources.Fonts.helvelticaRegular(with: 17)
        
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
