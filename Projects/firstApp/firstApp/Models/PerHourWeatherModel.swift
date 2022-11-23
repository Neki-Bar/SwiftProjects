//
//  PerHourWeatherModel.swift
//  firstApp
//
//  Created by Leo on 10.10.2022.
//

import Foundation
import UIKit

struct PerHourWeatherModel: Decodable {
    var imageName: String
    var temperature: Unit
    var time: Date
    
    init() {
        imageName = "13"
        temperature = Unit(unit: "C", value: 13.2)
        time = Date()
    }
    
    enum CodingKeys: String, CodingKey {
        case imageName = "WeatherIcon"
        case temperature = "Temperature"
        case time = "DateTime"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let imageID = try container.decode(Int.self, forKey: .imageName)
        self.imageName = "\(imageID)"
        self.temperature = try container.decode(Unit.self, forKey: .temperature)
        self.time = try container.decode(Date.self, forKey: .time)
    }
}
