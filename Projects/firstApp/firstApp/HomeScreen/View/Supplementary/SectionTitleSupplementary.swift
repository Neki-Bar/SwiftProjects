//
//  SectionTitleSupplementary.swift
//  firstApp
//
//  Created by Leo on 13.10.2022.
//

import UIKit

final class SectionTitleSupplementary: UICollectionReusableView {
    
    private let title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = .systemFont(ofSize: 20, weight: .bold)
        return title
    }()
    
    func setupView(for section: SupplementaryId) {
        switch section {
            case .hourlyHeader:
                title.text = "Hourly Weather"
            case .dailyHeader:
                title.text = "Daily"
        }
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
        title.contentCompressionResistancePriority(for: .horizontal)
    }
}
