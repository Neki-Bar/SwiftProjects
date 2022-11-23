//
//  UIPerHourWeatherModel.swift
//  firstApp
//
//  Created by Nikita on 23.11.2022.
//

import Foundation

struct UIPerHourWeatherModel {
    var imageName: String
    var temperature: String
    var time: String
    
    init() {
        self.imageName = "13"
        self.temperature = "13.2 ºC"
        self.time = "3.00 PM"
    }
    
    
    init(imageName: String, temperature: String, time: String) {
        self.imageName = imageName
        self.temperature = temperature
        self.time = time
    }
}
