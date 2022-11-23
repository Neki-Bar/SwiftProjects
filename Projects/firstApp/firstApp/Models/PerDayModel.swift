//
//  AdditionalCityModel.swift
//  firstApp
//
//  Created by Leo on 10.10.2022.
//

import Foundation
import UIKit

struct PerDayModel: Decodable {
    var imageName: String
    var date: Date
    var state: String
    var temperature: Unit
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case temperature = "Temperature"
        case dayState = "Day"
        
        enum AdditionalCodingKeys: String, CodingKey {
            case temperature = "Maximum"
            case imageName = "Icon"
            case state = "IconPhrase"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(Date.self, forKey: .date)
        let tempContainer = try container.nestedContainer(keyedBy: CodingKeys.AdditionalCodingKeys.self,
                                                      forKey: .temperature)
        self.temperature = try tempContainer.decode(Unit.self, forKey: .temperature)
        let stateContainer = try container.nestedContainer(keyedBy: CodingKeys.AdditionalCodingKeys.self,
                                                           forKey: .dayState)
        let imageID = try stateContainer.decode(Int.self, forKey: .imageName)
        self.imageName = "\(imageID)"
        self.state = try stateContainer.decode(String.self, forKey: .state)
    }
    
    init() {
        imageName = "13"
        date = Date()
        state = "Cloudy"
        temperature = Unit(unit: "C", value: 13.2)
    }
}
