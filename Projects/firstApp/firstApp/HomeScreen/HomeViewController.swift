//
//  ViewController.swift
//  firstApp
//
//  Created by Leo on 02.10.2022.
//

import UIKit

enum SectionId: Int, CaseIterable{
    case currentDaySection
    case perHourWeatherSection
    case perDaySection
}

enum CellId{
    case currentDayCell
    case perHourWeatherCell
    case perDayCell
    
    func reuseId() -> String{
        switch self{
            case .currentDayCell:
                return "currentDayCell"
            case .perHourWeatherCell:
                return "perHourWeatherCell"
            case .perDayCell:
                return "perDayCell"
        }
    }
}

enum SupplementaryId: Int{
    case hourlyHeader
    case dailyHeader
    
    func reuseId() -> String{
        switch self{
            case .hourlyHeader:
                return "hourlyHeader"
            case .dailyHeader:
                return "hourlyHeader"
        }
    }
}

final class HomeViewController: UIViewController {
    var viewModel: HomeViewModel!
    
    var homeCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<SectionId, UUID>!
    
    var list1 = [UUID()]
    var list2 = [UUID(), UUID(), UUID(), UUID(), UUID(), UUID()]
    var list3 = [UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID()]
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        addSubviews()
        registerViews()
        layoutSubviews()
        createDataSource()
        reloadData()
    }

    func createCollectionView(){
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    }
    
    func registerViews(){
        homeCollectionView.register(CurrentDayCell.self, forCellWithReuseIdentifier: CellId.currentDayCell.reuseId())
        homeCollectionView.register(PerHourWeatherCell.self, forCellWithReuseIdentifier: CellId.perHourWeatherCell.reuseId())
        homeCollectionView.register(PerDayCell.self, forCellWithReuseIdentifier: CellId.perDayCell.reuseId())
        
        homeCollectionView.register(SectionTitleSupplementary.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SupplementaryId.hourlyHeader.reuseId())
    }
    
    func createDataSource(){
        let source = UICollectionViewDiffableDataSource<SectionId, UUID>(collectionView: homeCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: UUID) -> UICollectionViewCell? in
            switch SectionId(rawValue: indexPath.section)!{
                case .currentDaySection:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.currentDayCell.reuseId(), for: indexPath) as? CurrentDayCell
                    cell?.setupView()
                    return cell
                case .perHourWeatherSection:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.perHourWeatherCell.reuseId(), for: indexPath) as? PerHourWeatherCell
                    cell?.setupView()
                    return cell
                case .perDaySection:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.perDayCell.reuseId(), for: indexPath) as? PerDayCell
                    cell?.setupView()
                    return cell
            }
        }
        
        source.supplementaryViewProvider = { [ weak self ] (collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if elementKind == UICollectionView.elementKindSectionHeader {
                switch SectionId(rawValue: indexPath.section)! {
                    case .currentDaySection:
                        return nil
                    case .perHourWeatherSection:
                        let header = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: SupplementaryId.hourlyHeader.reuseId(), for:  indexPath) as? SectionTitleSupplementary
                        header?.setupView(for: SupplementaryId(rawValue: indexPath.section - 1 )!)
                        return header
                    case .perDaySection:
                        let header = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: SupplementaryId.hourlyHeader.reuseId(), for:  indexPath) as? SectionTitleSupplementary
                        header?.setupView(for: SupplementaryId(rawValue: indexPath.section - 1 )!)
                        return header
                }
            }
            return nil
        }
        
        dataSource = source
    }
    
    func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<SectionId, UUID>()
        snapshot.appendSections([.currentDaySection, .perHourWeatherSection, .perDaySection])
        
        for section in snapshot.sectionIdentifiers {
            switch section{
                case .currentDaySection:
                    snapshot.appendItems(list1, toSection: section)
                case .perHourWeatherSection:
                    snapshot.appendItems(list2, toSection: section)
                case .perDaySection:
                    snapshot.appendItems(list3, toSection: section)
            }
           
        }
        
        dataSource.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch SectionId(rawValue: sectionIndex)! {
            case .currentDaySection:
                return self.createCurrentCityLayout()
            case .perHourWeatherSection:
                return self.createPerHourWeatherLayout()
            case .perDaySection:
                return self.createAdditionalCityLayout()
            }
        }
        return layout
    }

    func addSubviews(){
        view.backgroundColor = .white
        view.addSubview(homeCollectionView)
    }
    
    func layoutSubviews(){
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(95), heightDimension: .estimated(107))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(65))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func createAdditionalCityLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(84))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
        
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(65))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        section.boundarySupplementaryItems = [header]
        return section
    }
}

