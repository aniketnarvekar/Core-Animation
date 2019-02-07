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
        let view = UIView(frame: CGRect(x: 75, y: 75, width: 100, height: 100))
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
        let opacityAnimation = changeOpacity(from: from, to: to, with: duration, repleatCount: Float.infinity, autoreverses: true)
        self.animatableView.layer.add(opacityAnimation, forKey: "opacity")
        let posistionAnimation = changePosition(from: CGPoint(x: 75, y: 75), to: view.center, duration: 2.0, repeatCount: Float.infinity, autoreverses: true, timingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
        self.animatableView.layer.add(posistionAnimation, forKey: "position")
        //        self.animatableView.layer.position = view.center
    }
    
    /// Change and animate opacity of view
    ///
    /// - Parameters:
    ///   - from: Defines the value the receiver uses to start interpolation.
    ///   - to: Defines the value the receiver uses to end interpolation.
    ///   - duration: Specifies the basic duration of the animation, in seconds.
    ///   - repleatCount: Determines the number of times the animation will repeat.
    ///   - autoreverses: Determines if the receiver plays in the reverse upon completion.
    /// - Returns: The abstract superclass for animations in Core Animation.
    fileprivate func changeOpacity(from: Any?, to: Any?,with duration: CFTimeInterval, repleatCount: Float = 0, autoreverses: Bool = false) -> CAAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = from
        opacityAnimation.toValue = to
        opacityAnimation.duration = duration
        opacityAnimation.repeatCount = repleatCount
        opacityAnimation.autoreverses = autoreverses
        return opacityAnimation
    }
    
    /// Change Position of View.
    ///
    /// - Parameters:
    ///   - from: Defines the value the receiver uses to start interpolation.
    ///   - to: Defines the value the receiver uses to end interpolation.
    ///   - duration:  Specifies the basic duration of the animation, in seconds.
    ///   - repeatCount: Determines the number of times the animation will repeat.
    ///   - autoreverses: Determines if the receiver plays in the reverse upon completion.
    ///   - timingFunction: A function that defines the pacing of an animation as a timing curve.
    /// - Returns: An object that provides basic, single-keyframe animation capabilities for a layer property.
    fileprivate func changePosition(from: CGPoint, to: CGPoint, duration: Double, repeatCount: Float = 0, autoreverses: Bool = false, timingFunction: CAMediaTimingFunction? = nil) -> CABasicAnimation {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = from
        positionAnimation.toValue = to
        positionAnimation.duration = duration
        positionAnimation.autoreverses = autoreverses
        positionAnimation.repeatCount = repeatCount
        positionAnimation.timingFunction = timingFunction
        return positionAnimation
    }
    
}
