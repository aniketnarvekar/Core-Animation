//
//  ViewController.swift
//  Core Animation
//
//  Created by Aniket Narvekar on 28/01/19.
//  Copyright © 2019 THK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animatableView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.animatableView)
        let from = 0.0
        let to = 1.0
        let duration = 3.0
        let opacityAnimation = changeOpacity(from: from, to: to, with: duration)
        self.animatableView.layer.add(opacityAnimation, forKey: "opacity")
        self.animatableView.layer.opacity = 1.0
        
    }
    
    fileprivate func changeOpacity(from: Any?, to: Any?,with duration: CFTimeInterval ) -> CAAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = from
        opacityAnimation.toValue = to
        opacityAnimation.duration = duration
        return opacityAnimation
    }


}
