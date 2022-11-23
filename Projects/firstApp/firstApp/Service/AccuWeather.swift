//
//  AccuWeather.swift
//  firstApp
//
//  Created by Nikita on 27.10.2022.
//

import Foundation
import Moya

public enum AccuWeather {
    case current
    case hourly
    case daily
}

extension AccuWeather: TargetType {
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var baseURL: URL {
        return URL(string: "http://dataservice.accuweather.com")!
    }
    public var path: String {
        switch self {
        case .current:
            return "/currentconditions/v1/322464"
        case .hourly:
            return "/forecasts/v1/hourly/12hour/322464"
        case .daily:
            return "/forecasts/v1/daily/5day/322464"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .current:
            return .requestParameters(parameters: ["apikey": "xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp"],
                                      encoding: URLEncoding.default)
        case .hourly:
            return .requestParameters(parameters: ["apikey": "xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp",
                                                   "metric": "true"],
                                      encoding: URLEncoding.default)
        case .daily:
            return .requestParameters(parameters: ["apikey": "xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp",
                                                   "metric": "true"],
                                      encoding: URLEncoding.default)
        }
        
    }
    
    public var sampleData: Data {
        return "{\"weather\":\"clear\"}".data(using: String.Encoding.utf8)!
    }
}
