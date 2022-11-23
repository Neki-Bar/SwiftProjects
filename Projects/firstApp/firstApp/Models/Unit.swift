//
//  Temperature.swift
//  firstApp
//
//  Created by Nikita on 23.11.2022.
//

import Foundation

struct Unit: Decodable {
    var unit: String
    var value: Double
    
    enum CodingKeys: String, CodingKey {
        case unit = "Unit"
        case value = "Value"
    }
}
