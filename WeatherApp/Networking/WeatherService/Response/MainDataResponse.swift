//
//  MainDataResponse.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

struct MainData: Codable {
    var temp: Double
    var pressure: Double
    var humidity: Double
}
