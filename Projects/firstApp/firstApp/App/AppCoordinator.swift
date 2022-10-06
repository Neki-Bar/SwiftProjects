//
//  AppCoordinator.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        var homeCoordinator = HomeCoordinator(navigationController: navigationController)
        
        homeCoordinator.start()
    }
}
