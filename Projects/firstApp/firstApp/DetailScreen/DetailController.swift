//
//  DetailController.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit

class DetailController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
   
    func configure() {
        view.backgroundColor = UIColor.red
        let coll = UIView(frame: .zero)
        view.addSubview(coll)
        
        coll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            coll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        coll.backgroundColor = UIColor.white
    }
}

