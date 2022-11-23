//
//  PerHourWeatherCell.swift
//  firstApp
//
//  Created by Leo on 07.10.2022.
//

import UIKit

final class PerHourWeatherCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let weatherIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloudy"))
        return image
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#201c1cff")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "20º"
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#494343ff")
        label.font = .systemFont(ofSize: 12)
        label.text = "4.00 PM"
        return label
    }()
    
    func setupView(from model: UIPerHourWeatherModel) {
       //weatherIcon
        temperatureLabel.text = model.temperature
        timeLabel.text = model.time
    }
    
    func configure() {
        setupLayer()
        setupLayout()
    }
    
    private func setupLayer() {
        self.backgroundColor = UIColor(hex: "#fbfbfbff")
        self.layer.cornerRadius = 4
    }
    
    private func setupLayout() {
        contentView.addSubview(weatherIcon)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(timeLabel)
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.widthAnchor.constraint(equalToConstant: 48),
            weatherIcon.heightAnchor.constraint(equalToConstant: 48),
            weatherIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherIcon.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
        ])
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        temperatureLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8),
            timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        timeLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
    }
    
    
}
