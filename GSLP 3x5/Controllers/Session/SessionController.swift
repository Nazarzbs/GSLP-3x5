//
//  SessionController.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import Foundation

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Session"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }


}
