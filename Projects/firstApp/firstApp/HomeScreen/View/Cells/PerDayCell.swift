//
//  AdditionalCityCell.swift
//  firstApp
//
//  Created by Leo on 07.10.2022.
//

import UIKit

final class PerDayCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let roundedView: UIView = {
        let circle = UIView()
        let path = UIBezierPath(arcCenter: CGPoint(x: 24, y: 24), radius: 24, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor(hex: "#9ab6ffff")?.cgColor
        circle.layer.addSublayer(circleLayer)
        return circle
    }()
    
    private let weatherIcon: UIImageView = {
        return UIImageView(image: UIImage(named: "cloudy"))
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#201c1cff")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Monday"
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#494343ff")
        label.font = .systemFont(ofSize: 13)
        label.text = "Cloudy"
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#201c1cff")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "17º C"
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        return UIImageView(image: UIImage(named: "arrow"))
    }()
    
    public func setupView() {
        setupLayer()
        setupLayout()
    }
    
    private func setupLayer() {
        self.backgroundColor = UIColor(hex: "#d2dfffff")
        self.layer.cornerRadius = 12
    }
    
    private func setupLayout() {
        contentView.addSubview(roundedView)
        contentView.addSubview(weatherIcon)
        contentView.addSubview(dayLabel)
        contentView.addSubview(stateLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(arrowIcon)
        
        
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedView.widthAnchor.constraint(equalToConstant: 48),
            roundedView.heightAnchor.constraint(equalTo: roundedView.widthAnchor),
            roundedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            roundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.widthAnchor.constraint(equalToConstant: 48),
            weatherIcon.heightAnchor.constraint(equalTo: weatherIcon.widthAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            weatherIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 15),
            dayLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -4)
        ])
        dayLabel.contentCompressionResistancePriority(for: .horizontal)
        
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 15),
            stateLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 4)
        ])
        stateLabel.contentCompressionResistancePriority(for: .horizontal)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        temperatureLabel.contentCompressionResistancePriority(for: .horizontal)
        
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowIcon.widthAnchor.constraint(equalToConstant: 40),
            arrowIcon.heightAnchor.constraint(equalTo: arrowIcon.widthAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
}
