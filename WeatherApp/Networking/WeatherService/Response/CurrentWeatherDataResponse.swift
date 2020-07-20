//
//  CurrentWeatherDataResponse.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
    var name: String = ""
    var weather = [WeatherData]()
    var main: MainData?
}
