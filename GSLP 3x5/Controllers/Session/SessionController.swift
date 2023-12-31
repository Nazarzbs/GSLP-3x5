//
//  SessionController.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

class SessionController: BaseController {
    private let timerView = TimerView()
    private let exercisesView = ExercisesView()
    
    private let timerDuration = 15.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.navBarRightButtonHandler()
                }
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavBarButton(timerView.state == .isRunning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart, at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController {
    
    override func setupViews() {
        super.setupViews()
         
        view.setupViews(timerView, exercisesView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
            exercisesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            exercisesView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            exercisesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            exercisesView.heightAnchor.constraint(equalToConstant: 320),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.0)
    }
}
