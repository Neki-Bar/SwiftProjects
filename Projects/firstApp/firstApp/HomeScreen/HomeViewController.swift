//
//  ViewController.swift
//  firstApp
//
//  Created by Leo on 02.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeCollectionView: HomeCollectionView = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        let homeCompositionalLayout = HomeCompositionalLayout(section: section)
        
        var collectionView = HomeCollectionView(frame: .zero , collectionViewLayout: homeCompositionalLayout)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        layoutSubviews()
    }


    func addSubviews(){
        
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self

        homeCollectionView.backgroundColor = .red
        
        view.backgroundColor = .white
        
        view.addSubview(homeCollectionView)
    }
    
    func layoutSubviews(){
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }


}

