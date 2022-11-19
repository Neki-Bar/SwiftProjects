//
//  DetailCoordinator.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit

class DetailCoordinator: Coordinator{
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let detailViewController = DetailController(coordinator: self)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func toHome() {
        navigationController.popViewController(animated: true)
    }
}
