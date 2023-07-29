//
//  Resources.swift
//  GSLP 3x5
//
//  Created by Nazar on 24.07.2023.
//

import UIKit

typealias R = Resources

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#437BFE")
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: "Overview"
                case .progress: "Progress"
                case .session: "Session"
                case .settings: "Settings"
                }
            }
        }
        
        enum NavBar {
            static let session = "Session"
            static let progress = "Workout progress"
            static let settings = "Settings"
            static let overview = "Today"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
        
        enum Session {
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            static let navBarStart = "Start   "
        }
        
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: UIImage(named: "overview_tab")
                case .progress: UIImage(named: "progress_tab")
                case .session: UIImage(named: "session_tab")
                case .settings: UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont() 
        }
    }
}
