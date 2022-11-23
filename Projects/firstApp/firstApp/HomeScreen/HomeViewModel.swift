//
//  HomeViewModel.swift
//  firstApp
//
//  Created by Leo on 04.10.2022.
//

import UIKit
import Moya

final class HomeViewModel{
    var currentDayModel: Dynamic<UICurrentDayModel>? = nil
    var perHourModels: [Dynamic<UIPerHourWeatherModel>]? = nil
    var perDayModels = Dynamic([PerDayModel]())
    
    private var provider: MoyaProvider<AccuWeather>
    
    init(provider: MoyaProvider<AccuWeather>) {
        self.provider = provider
        getCurrentWeather()
        getPerHourWeather()
        getPerDay()
    }
    
    func getCurrentWeather() {
        provider.request(.current) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let model = try decoder.decode(CurrentDayModel.self, from: response.data)
                    let uiModel = self.createUICurrentDayModel(from: model)
                    self.currentDayModel?.value = uiModel
                } catch {
                    print("Decoding error of CurrentWeather")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    func getPerHourWeather() {
        provider.request(.hourly) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let model = try decoder.decode([PerHourWeatherModel].self, from: response.data)
                    var models = [Dynamic<UIPerHourWeatherModel>]()
                    model.forEach({ model in
                        models.append(Dynamic(self.createUIPerHourWeatherModel(from: model)))
                    })
                    self.perHourModels = models
                    print(model)
                } catch {
                    print("Decoding error of perHourModels")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    func getPerDay() {
        provider.request(.daily) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let container = try decoder.decode(PerDayModelContainer.self, from: response.data)
                    let model = container.models
                    self.perDayModels.value = model
                    print(model)
                } catch {
                    print("Decoding error of PerDayModels")
                }
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    private func createUICurrentDayModel(from model: CurrentDayModel) -> UICurrentDayModel{
        let temp = model.temperature.metric.value
        let unit = "º\(model.temperature.metric.unit)"
        let temperature = "\(temp) \(unit)"
        
        let currentDateformatter = DateFormatter()
        let dateFormat = "EEEE, MMMM dd, yyyy"
        currentDateformatter.dateFormat = dateFormat
        currentDateformatter.locale = Locale(identifier: "en-US")
        let currentDate = Date.now
        let date = currentDateformatter.string(from: currentDate)

        currentDateformatter.dateFormat = "hh.mm a"
        let time = currentDateformatter.string(from: currentDate)

        return UICurrentDayModel(imageName: model.imageName,
                                 temperature: temperature,
                                 state: model.state,
                                 date: date,
                                 time: time)
    }
    
    private func createUIPerHourWeatherModel(from model: PerHourWeatherModel) -> UIPerHourWeatherModel {
        let temperature = "\(model.temperature.value)º"
        
        let Dateformatter = DateFormatter()
        Dateformatter.locale = Locale(identifier: "en-US")
        Dateformatter.dateFormat = "hh.mm a"
        let time = Dateformatter.string(from: model.time)
        
        return UIPerHourWeatherModel(imageName: model.imageName,
                                     temperature: temperature,
                                     time: time)
    }
}
