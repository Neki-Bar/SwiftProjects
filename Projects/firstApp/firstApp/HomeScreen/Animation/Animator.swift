//
//  Animator.swift
//  firstApp
//
//  Created by Nikita on 17.11.2022.
//

import Foundation
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
        }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toView = transitionContext.view(forKey: .to),
            let fromView = transitionContext.view(forKey: .from),
            let coll = fromView.subviews[0] as? UICollectionView,
            let cell = coll.cellForItem(at: IndexPath(row: 0, section: 0)) as? CurrentDayCell
        else {
            print("coll is nil")
            return
        }
        
        let fr = cell.frame
        print(fr)
        toView.center = CGPoint(x: fr.midX , y: fr.midY + fr.origin.y + toView.safeAreaInsets.top)
        toView.transform = CGAffineTransform(scaleX: cell.frame.width / toView.frame.width, y: cell.frame.height / toView.frame.height)
        toView.layer.cornerRadius = 12
        transitionContext.containerView.addSubview(toView)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
            toView.transform = .identity
            toView.center = fromView.center
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    
    
}
