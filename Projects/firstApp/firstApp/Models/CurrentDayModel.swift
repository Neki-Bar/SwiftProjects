//
//  CurrentCItyModel.swift
//  firstApp
//
//  Created by Leo on 10.10.2022.
//

import Foundation
import UIKit

struct CurrentDayModel: Decodable {
    var date: Date
    var image: String
    var temperature: Int
    var state: String
    var lastUpdateTime: Date
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case image = "icon"
        case temperature = "temp"
        case state = "description"
        case lastUpdateTime
    }
}
