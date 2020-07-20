//
//  Result.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
