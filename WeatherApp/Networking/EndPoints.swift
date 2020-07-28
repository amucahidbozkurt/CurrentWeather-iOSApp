//
//  EndPoints.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

struct EndPoint {
    
    enum BaseUrl: String {
        case prod = "http://api.openweathermap.org/data/2.5/weather"
    }

    static let apiKey = "6b31419b179bf6e22208bbc37e70ed0a"
    static let latKey = "&lat="
    static let lonKey = "&lon="
    
    static let getWeatherDetail = "\(Preferences.baseApi.rawValue)?appid=\(EndPoint.apiKey)&units=metric"

}
