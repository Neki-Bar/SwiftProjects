//
//  CurrentCityCell.swift
//  firstApp
//
//  Created by Leo on 07.10.2022.
//

import UIKit

final class CurrentDayCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "Monday, December 20, 2021"
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "3.30 PM"
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloudy"))
        return image
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.text = "18º C"
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Cloudy Rain"
        return label
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Last update 3.00 PM", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    func setupView(){
        insertBackground()
        setupLayout()
        clipsToBounds = true
        layer.cornerRadius = 12
    }
    
    
    
    private var back: CALayer?
    
    func insertBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: layer.bounds.width, height: 770)
        gradientLayer.colors = [UIColor(hex: "#4f7ffaff")?.cgColor, UIColor(hex: "#335fd1ff")?.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 12
        back = gradientLayer
        layer.insertSublayer(gradientLayer, at: 7)
    }
    
    func removeBackground() {
        back?.removeFromSuperlayer()
    }
    
    
    private func setupLayout(){
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherIcon)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(stateLabel)
        contentView.addSubview(updateButton)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            dateLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        dateLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            timeLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        timeLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.widthAnchor.constraint(equalToConstant: 128),
            weatherIcon.heightAnchor.constraint(equalTo: weatherIcon.widthAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            weatherIcon.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 96)
        ])
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: weatherIcon.centerYAnchor, constant: -4)
        ])
        temperatureLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor),
            stateLabel.topAnchor.constraint(equalTo: weatherIcon.centerYAnchor, constant: 4)
        ])
        temperatureLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            updateButton.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 169),
            updateButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        updateButton.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
    }
    
    
}
