//
//  Logger.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

class Logger {

    static func debug(_ obj: Any) {
        if Preferences.isDebug {
            print(obj)
        }
    }

}
