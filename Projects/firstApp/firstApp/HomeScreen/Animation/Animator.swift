//
//  Animator.swift
//  firstApp
//
//  Created by Nikita on 17.11.2022.
//

import Foundation
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let present: Bool!
    
    init(present: Bool) {
        self.present = present
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
        }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let duration = self.transitionDuration(using: transitionContext)
        
        if present {
            
            guard
                let fromController = transitionContext.viewController(forKey: .from) as? HomeViewController,
                let toView = transitionContext.view(forKey: .to),
                let fromView = transitionContext.view(forKey: .from),
                let coll = fromView.subviews[0] as? UICollectionView
            else {
                return
            }
            
            let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                switch SectionId(rawValue: sectionIndex)! {
                case .currentDaySection:
                    return createCurrentCityLayout()
                case .perHourWeatherSection:
                    return fromController.createPerHourWeatherLayout()
                case .perDaySection:
                    return fromController.createAdditionalCityLayout()
                }
            }
            
            
            UIView.animate(withDuration: 0.3,
                           animations: {
                                coll.scrollsToTop = true
                            },
                           completion: {_ in
                                animateCell()
                            })
            func animateCell() {
                coll.setCollectionViewLayout(layout, animated: true, completion: {_ in
                    transitionContext.containerView.addSubview(toView)
                    toView.alpha = 0
                    
                    UIView.animate(withDuration: duration,
                                   animations: {
                        toView.alpha = 1
                    }, completion: { _ in
                        transitionContext.completeTransition(true)
                    })
                })
            }
            
        } else {
            guard
                let toController = transitionContext.viewController(forKey: .to) as? HomeViewController,
                let toView = transitionContext.view(forKey: .to),
                let fromView = transitionContext.view(forKey: .from),
                let coll = toView.subviews[0] as? UICollectionView
            else {
                print("guard")
                return
            }
            transitionContext.containerView.addSubview(toView)
            
            
            
            

            UIView.animate(withDuration: 0.3, animations: {
                fromView.alpha = 0
            }, completion: { _ in
                coll.setCollectionViewLayout(toController.createCompositionalLayout(), animated: true, completion: { _ in
                    transitionContext.completeTransition(true)
                })
            })
            
            
            
        }
        
        
        
        
        func createCurrentCityLayout() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(730))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 50, trailing: 10)
            return section
        }
        
        
        
       
    }
    
    
}
