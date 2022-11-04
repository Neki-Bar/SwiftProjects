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
        return .requestParameters(parameters: ["apikey": "xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp"],
                                  encoding: URLEncoding.default)
    }
    
    public var sampleData: Data {
        return "{\"weather\":\"clear\"}".data(using: String.Encoding.utf8)!
    }
}

//http://dataservice.accuweather.com/locations/v1/cities/search?apikey=xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp&q=simfero

//[
//  {
//    "Version": 1,
//    "Key": "322464",
//    "Type": "City",
//    "Rank": 31,
//    "LocalizedName": "Simferopol",
//    "EnglishName": "Simferopol",
//    "PrimaryPostalCode": "",
//    "Region": {
//      "ID": "EUR",
//      "LocalizedName": "Europe",
//      "EnglishName": "Europe"
//    },
//    "Country": {
//      "ID": "UA",
//      "LocalizedName": "Ukraine",
//      "EnglishName": "Ukraine"
//    },
//    "AdministrativeArea": {
//      "ID": "43",
//      "LocalizedName": "Crimea",
//      "EnglishName": "Crimea",
//      "Level": 1,
//      "LocalizedType": "Republic",
//      "EnglishType": "Republic",
//      "CountryID": "UA"
//    },
//    "TimeZone": {
//      "Code": "MSK",
//      "Name": "Europe/Simferopol",
//      "GmtOffset": 3,
//      "IsDaylightSaving": true,
//      "NextOffsetChange": null
//    },
//    "GeoPosition": {
//      "Latitude": 44.952,
//      "Longitude": 34.102,
//      "Elevation": {
//        "Metric": {
//          "Value": 246,
//          "Unit": "m",
//          "UnitType": 5
//        },
//        "Imperial": {
//          "Value": 806,
//          "Unit": "ft",
//          "UnitType": 0
//        }
//      }
//    },
//    "IsAlias": false,
//    "SupplementalAdminAreas": [],
//    "DataSets": [
//      "AirQualityCurrentConditions",
//      "AirQualityForecasts",
//      "Alerts",
//      "DailyPollenForecast",
//      "ForecastConfidence",
//      "FutureRadar",
//      "MinuteCast"
//    ]
//  }
//]

//http://dataservice.accuweather.com/currentconditions/v1/322464?apikey=xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp
//[
//  {
//    "LocalObservationDateTime": "2022-10-27T14:27:00+03:00",
//    "EpochTime": 1666870020,
//    "WeatherText": "Partly sunny",
//    "WeatherIcon": 3,
//    "HasPrecipitation": false,
//    "PrecipitationType": null,
//    "IsDayTime": true,
//    "Temperature": {
//      "Metric": {
//        "Value": 15,
//        "Unit": "C",
//        "UnitType": 17
//      },
//      "Imperial": {
//        "Value": 59,
//        "Unit": "F",
//        "UnitType": 18
//      }
//    },
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/current-weather/322464?lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/current-weather/322464?lang=en-us"
//  }
//]


//http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/322464?apikey=xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp

//[
//  {
//    "DateTime": "2022-10-27T15:00:00+03:00",
//    "EpochDateTime": 1666872000,
//    "WeatherIcon": 3,
//    "IconPhrase": "Partly sunny",
//    "HasPrecipitation": false,
//    "IsDaylight": true,
//    "Temperature": {
//      "Value": 58,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 7,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=15&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=15&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T16:00:00+03:00",
//    "EpochDateTime": 1666875600,
//    "WeatherIcon": 2,
//    "IconPhrase": "Mostly sunny",
//    "HasPrecipitation": false,
//    "IsDaylight": true,
//    "Temperature": {
//      "Value": 57,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 7,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=16&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=16&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T17:00:00+03:00",
//    "EpochDateTime": 1666879200,
//    "WeatherIcon": 2,
//    "IconPhrase": "Mostly sunny",
//    "HasPrecipitation": false,
//    "IsDaylight": true,
//    "Temperature": {
//      "Value": 54,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 5,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=17&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=17&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T18:00:00+03:00",
//    "EpochDateTime": 1666882800,
//    "WeatherIcon": 36,
//    "IconPhrase": "Intermittent clouds",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 51,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=18&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=18&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T19:00:00+03:00",
//    "EpochDateTime": 1666886400,
//    "WeatherIcon": 36,
//    "IconPhrase": "Intermittent clouds",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 50,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=19&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=19&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T20:00:00+03:00",
//    "EpochDateTime": 1666890000,
//    "WeatherIcon": 36,
//    "IconPhrase": "Intermittent clouds",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 47,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=20&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=20&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T21:00:00+03:00",
//    "EpochDateTime": 1666893600,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 46,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=21&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=21&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T22:00:00+03:00",
//    "EpochDateTime": 1666897200,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 45,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=22&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=22&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-27T23:00:00+03:00",
//    "EpochDateTime": 1666900800,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 45,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=23&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=1&hbhhour=23&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-28T00:00:00+03:00",
//    "EpochDateTime": 1666904400,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 42,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=0&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=0&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-28T01:00:00+03:00",
//    "EpochDateTime": 1666908000,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 45,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=1&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=1&lang=en-us"
//  },
//  {
//    "DateTime": "2022-10-28T02:00:00+03:00",
//    "EpochDateTime": 1666911600,
//    "WeatherIcon": 38,
//    "IconPhrase": "Mostly cloudy",
//    "HasPrecipitation": false,
//    "IsDaylight": false,
//    "Temperature": {
//      "Value": 45,
//      "Unit": "F",
//      "UnitType": 18
//    },
//    "PrecipitationProbability": 0,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=2&lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/hourly-weather-forecast/322464?day=2&hbhhour=2&lang=en-us"
//  }
//]


//http://dataservice.accuweather.com/forecasts/v1/daily/5day/322464?apikey=xlxkAAypGLgP1X5eALMhT4xtRWkEQbzp

//{
//  "Headline": {
//    "EffectiveDate": "2022-10-31T18:00:00+03:00",
//    "EffectiveEpochDate": 1667228400,
//    "Severity": 7,
//    "Text": "Cool Monday night",
//    "Category": "cold",
//    "EndDate": "2022-11-01T06:00:00+03:00",
//    "EndEpochDate": 1667271600,
//    "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?lang=en-us",
//    "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?lang=en-us"
//  },
//  "DailyForecasts": [
//    {
//      "Date": "2022-10-27T07:00:00+03:00",
//      "EpochDate": 1666843200,
//      "Temperature": {
//        "Minimum": {
//          "Value": 42,
//          "Unit": "F",
//          "UnitType": 18
//        },
//        "Maximum": {
//          "Value": 60,
//          "Unit": "F",
//          "UnitType": 18
//        }
//      },
//      "Day": {
//        "Icon": 4,
//        "IconPhrase": "Intermittent clouds",
//        "HasPrecipitation": false
//      },
//      "Night": {
//        "Icon": 38,
//        "IconPhrase": "Mostly cloudy",
//        "HasPrecipitation": false
//      },
//      "Sources": [
//        "AccuWeather"
//      ],
//      "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=1&lang=en-us",
//      "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=1&lang=en-us"
//    },
//    {
//      "Date": "2022-10-28T07:00:00+03:00",
//      "EpochDate": 1666929600,
//      "Temperature": {
//        "Minimum": {
//          "Value": 42,
//          "Unit": "F",
//          "UnitType": 18
//        },
//        "Maximum": {
//          "Value": 57,
//          "Unit": "F",
//          "UnitType": 18
//        }
//      },
//      "Day": {
//        "Icon": 4,
//        "IconPhrase": "Intermittent clouds",
//        "HasPrecipitation": false
//      },
//      "Night": {
//        "Icon": 36,
//        "IconPhrase": "Intermittent clouds",
//        "HasPrecipitation": false
//      },
//      "Sources": [
//        "AccuWeather"
//      ],
//      "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=2&lang=en-us",
//      "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=2&lang=en-us"
//    },
//    {
//      "Date": "2022-10-29T07:00:00+03:00",
//      "EpochDate": 1667016000,
//      "Temperature": {
//        "Minimum": {
//          "Value": 41,
//          "Unit": "F",
//          "UnitType": 18
//        },
//        "Maximum": {
//          "Value": 58,
//          "Unit": "F",
//          "UnitType": 18
//        }
//      },
//      "Day": {
//        "Icon": 3,
//        "IconPhrase": "Partly sunny",
//        "HasPrecipitation": false
//      },
//      "Night": {
//        "Icon": 34,
//        "IconPhrase": "Mostly clear",
//        "HasPrecipitation": false
//      },
//      "Sources": [
//        "AccuWeather"
//      ],
//      "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=3&lang=en-us",
//      "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=3&lang=en-us"
//    },
//    {
//      "Date": "2022-10-30T07:00:00+03:00",
//      "EpochDate": 1667102400,
//      "Temperature": {
//        "Minimum": {
//          "Value": 46,
//          "Unit": "F",
//          "UnitType": 18
//        },
//        "Maximum": {
//          "Value": 58,
//          "Unit": "F",
//          "UnitType": 18
//        }
//      },
//      "Day": {
//        "Icon": 4,
//        "IconPhrase": "Intermittent clouds",
//        "HasPrecipitation": false
//      },
//      "Night": {
//        "Icon": 8,
//        "IconPhrase": "Dreary",
//        "HasPrecipitation": false
//      },
//      "Sources": [
//        "AccuWeather"
//      ],
//      "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=4&lang=en-us",
//      "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=4&lang=en-us"
//    },
//    {
//      "Date": "2022-10-31T07:00:00+03:00",
//      "EpochDate": 1667188800,
//      "Temperature": {
//        "Minimum": {
//          "Value": 38,
//          "Unit": "F",
//          "UnitType": 18
//        },
//        "Maximum": {
//          "Value": 59,
//          "Unit": "F",
//          "UnitType": 18
//        }
//      },
//      "Day": {
//        "Icon": 2,
//        "IconPhrase": "Mostly sunny",
//        "HasPrecipitation": false
//      },
//      "Night": {
//        "Icon": 34,
//        "IconPhrase": "Mostly clear",
//        "HasPrecipitation": false
//      },
//      "Sources": [
//        "AccuWeather"
//      ],
//      "MobileLink": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=5&lang=en-us",
//      "Link": "http://www.accuweather.com/en/ua/simferopol/322464/daily-weather-forecast/322464?day=5&lang=en-us"
//    }
//  ]
//}
