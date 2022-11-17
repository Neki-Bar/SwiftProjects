//
//  Animator.swift
//  firstApp
//
//  Created by Nikita on 17.11.2022.
//

import Foundation
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
//    let duration: Double = 1
//    var presenting: Bool = true
//    var originFrame = CGRect.zero
    
    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return duration
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let containerView = transitionContext.containerView
//        let toView = transitionContext.view(forKey: .to)!
//
//        containerView.addSubview(toView)
//        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
//        UIView.animate(
//            withDuration: duration,
//            animations: {
//                toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            },
//            completion: { _ in
//                transitionContext.completeTransition(true)
//            }
//        )
//
//    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 2
        }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            return
        }
        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0

        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
    
}
