//
//  Coordinator.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
