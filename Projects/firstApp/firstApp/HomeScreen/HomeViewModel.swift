//
//  HomeViewModel.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit
import Moya

final class HomeViewModel{
    var currentDayModel = Dynamic(CurrentDayModel(date: Date(),
                                                  image: "ggg",
                                                  temperature: 14,
                                                  state: "zcyj",
                                                  lastUpdateTime: Date()))
    var perHourModels = Dynamic([PerHourWeatherModel(image: "gg",
                                                     temperature: 34,
                                                     time: "fddf")])
    var perDayModels = Dynamic([PerDayModel(image: "dgd",
                                            date: 24,
                                            state: "dfdg",
                                            temperature: 343)])
    
    private var provider: MoyaProvider<AccuWeather>
    
    init(provider: MoyaProvider<AccuWeather>) {
        self.provider = provider
        getCurrentWeather()
    }
    
    private func getCurrentWeather() {
        provider.request(.current) { result in
            switch result{
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
}
