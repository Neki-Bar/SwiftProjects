//
//  UICurrentDayModel.swift
//  firstApp
//
//  Created by Nikita on 23.11.2022.
//

import Foundation

struct UICurrentDayModel {
    var imageName: String
    var temperature: String
    var state: String
    var date: String
    var time: String
    
    init() {
        imageName = "13"
        temperature = "13.2 ºC"
        state = "Cloudy"
        date = "Monday, December 20, 2021"
        time = "3.30 PM"
    }
    
    init(imageName: String, temperature: String, state: String, date: String, time: String) {
        self.imageName = imageName
        self.temperature = temperature
        self.state = state
        self.date = date
        self.time = time
    }
}
