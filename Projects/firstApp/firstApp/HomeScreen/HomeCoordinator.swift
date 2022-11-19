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
    let detailCoordinator: DetailCoordinator

    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        detailCoordinator = DetailCoordinator(navigationController: navigationController)
    }
    
    func start(){
        let provider = MoyaProvider<AccuWeather>()
        let homeViewModel = HomeViewModel(provider: provider)
        let homeViewController = HomeViewController(viewModel: homeViewModel, coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func toDetail() {
        detailCoordinator.start()
    }
    
}
