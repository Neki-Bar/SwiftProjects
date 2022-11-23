//
//  CurrentCItyModel.swift
//  firstApp
//
//  Created by Leo on 10.10.2022.
//

import Foundation
import UIKit

struct CurrentDayModel: Decodable {
    var imageName: String
    var temperature: Temperature
    var state: String
    var lastUpdateTime: Date
    
    init() {
        imageName = "13"
        temperature = Temperature()
        state = "Cloudy"
        lastUpdateTime = Date()
    }
    
    
    enum CodingKeys: String, CodingKey {
        case imageName = "WeatherIcon"
        case temperature = "Temperature"
        case state = "WeatherText"
        case lastUpdateTime = "LocalObservationDateTime"
    }
    
    
    init(from decoder: Decoder) throws {
        var wrapper = try decoder.unkeyedContainer()
        let container = try wrapper.nestedContainer(keyedBy: CodingKeys.self)
        let iconID = try container.decode(Int.self, forKey: .imageName)
        imageName = "\(iconID)"
        state = try container.decode(String.self, forKey: .state)
        lastUpdateTime = try container.decode(Date.self, forKey: .lastUpdateTime)
        temperature = try container.decode(Temperature.self, forKey: .temperature)
    }
    
    struct Temperature: Decodable {
        var metric: Unit
        var imperial: Unit
        
        enum CodingKeys: String, CodingKey {
            case metric = "Metric"
            case imperial = "Imperial"
        }
        
        init() {
            metric = Unit(unit: "C", value: 13.2)
            imperial = Unit(unit: "F", value: 56.3)
        }
    }
}
