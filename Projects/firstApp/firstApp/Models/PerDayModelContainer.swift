//
//  PerDayModelContainer.swift
//  firstApp
//
//  Created by Nikita on 23.11.2022.
//

import Foundation


struct PerDayModelContainer: Decodable {
    var models: [PerDayModel]
    
    enum CodingKeys: String, CodingKey {
        case forecast = "DailyForecasts"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.models = try container.decode([PerDayModel].self, forKey: .forecast)
    }
    
    init() {
        models = [PerDayModel()]
    }
}
