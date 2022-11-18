//
//  DetailController.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit

enum SecId: Int, CaseIterable{
    case currentDaySection
    case perHourWeatherSection
}

enum CId{
    case currentDayCell
    case perHourWeatherCell
    
    func reuseId() -> String{
        switch self{
            case .currentDayCell:
                return "currentDayCell"
            case .perHourWeatherCell:
                return "perHourWeatherCell"
        }
    }
}


class DetailController: UIViewController {
    var detailCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<SecId, UUID>!
    
    let animator = Animator()
    
    var list1 = [UUID()]
    var list2 = [UUID(), UUID(), UUID(), UUID(), UUID(), UUID()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        addSubviews()
        registerViews()
        layoutSubviews()
        createDataSource()
        reloadData()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        gradientLayer.colors = [UIColor(hex: "#4f7ffaff")?.cgColor, UIColor(hex: "#335fd1ff")?.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        let background = UIView()
        background.layer.addSublayer(gradientLayer)
        detailCollectionView.backgroundView = background
    }
    
    func createCollectionView(){
        detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        detailCollectionView.delegate = self
    }
    
    func registerViews(){
        detailCollectionView.register(CurrentDayCell.self, forCellWithReuseIdentifier: CId.currentDayCell.reuseId())
        detailCollectionView.register(PerHourWeatherCell.self, forCellWithReuseIdentifier: CId.perHourWeatherCell.reuseId())
    }
    
    func addSubviews(){
        view.backgroundColor = .white
        view.addSubview(detailCollectionView)
    }
    
    func layoutSubviews(){
        detailCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createDataSource(){
        let source = UICollectionViewDiffableDataSource<SecId, UUID>(collectionView: detailCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: UUID) -> UICollectionViewCell? in
            switch SecId(rawValue: indexPath.section)!{
                case .currentDaySection:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CId.currentDayCell.reuseId(), for: indexPath) as? CurrentDayCell
                    cell?.setupView()
                    cell?.removeBackground()
                    return cell
                case .perHourWeatherSection:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CId.perHourWeatherCell.reuseId(), for: indexPath) as? PerHourWeatherCell
                    cell?.setupView()
                    return cell
            }
        }
        
        dataSource = source
    }
    
    func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<SecId, UUID>()
        snapshot.appendSections([.currentDaySection, .perHourWeatherSection])
        
        for section in snapshot.sectionIdentifiers {
            switch section{
                case .currentDaySection:
                    snapshot.appendItems(list1, toSection: section)
                case .perHourWeatherSection:
                    snapshot.appendItems(list2, toSection: section)
            }
           
        }
        
        dataSource.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch SecId(rawValue: sectionIndex)! {
            case .currentDaySection:
                return self.createCurrentCityLayout()
            case .perHourWeatherSection:
                return self.createPerHourWeatherLayout()
            }
        }
        return layout
    }
    
    func createCurrentCityLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(193))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    func createPerHourWeatherLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(96), heightDimension: .estimated(107))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 0)
        return section
    }
}
    
    

extension DetailController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
//            coordinator.toDetail()
        }
    }
}
