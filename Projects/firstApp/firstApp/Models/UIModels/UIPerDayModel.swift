//
//  UIPerDayModel.swift
//  firstApp
//
//  Created by Nikita on 23.11.2022.
//

import Foundation

struct UIPerDayModel {
    var imageName: String
    var date: String
    var state: String
    var temperature: String
    
    init(imageName: String, date: String, state: String, temperature: String) {
        self.imageName = imageName
        self.date = date
        self.state = state
        self.temperature = temperature
    }
    
    init() {
        self.imageName = "13"
        self.date = "Monday"
        self.state = "Cloudy"
        self.temperature = "17º C"
    }
}
