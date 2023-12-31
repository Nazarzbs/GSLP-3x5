//
//  UIView+ext.swift
//  GSLP 3x5
//
//  Created by Nazar on 25.07.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragInside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc
    func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    
    @objc
    func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
}

extension UIView {
    
    func setupViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}
