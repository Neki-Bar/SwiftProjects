//
//  WeatherTarget.swift
//  firstApp
//
//  Created by Nikita on 25.10.2022.
//

import Foundation
import Moya

public enum OpenWeather {
    case current
    case hourly
    case daily
}

extension OpenWeather: TargetType {
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var baseURL: URL {
        return URL(string: "http://api.openweathermap.org")!
    }
    public var path: String {
        return "/data/3.0/onecall"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
            case .current:
                return .requestParameters(parameters: ["appid": "13fda1439b44a8ade1b03e584c366ec5",
                                                       "lat": "44.9572",
                                                       "lon": "34.1108",
                                                       "exclude": "daily,minutely,hourly,alerts",
                                                       "units": "metric"],
                                          encoding: URLEncoding.default)
            case .hourly:
                return .requestParameters(parameters: ["appid": "13fda1439b44a8ade1b03e584c366ec5",
                                                       "lat": "44.9572",
                                                       "lon": "34.1108",
                                                       "exclude": "daily,minutely,current,alerts",
                                                       "units": "metric"],
                                          encoding: URLEncoding.default)
            case .daily:
                return .requestParameters(parameters: ["appid": "13fda1439b44a8ade1b03e584c366ec5",
                                                "lat": "44.9572",
                                                "lon": "34.1108",
                                                "exclude": "hourly,minutely,current,alerts",
                                                "units": "metric"],
                                          encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        return "{\"weather\":\"clear\"}".data(using: String.Encoding.utf8)!
    }
}

//http://api.openweathermap.org/data/3.0/onecall?appid=13fda1439b44a8ade1b03e584c366ec5&lat=44.9572&lon=34.1108&exclude=daily,minutely,hourly,alerts&units=metric
