//
//  HomeCoordinator.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit
import Moya

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let provider = MoyaProvider<AccuWeather>()
        let homeViewModel = HomeViewModel(provider: provider)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
