//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

class WeatherService: APIClient {
    
    func getWeatherDetailsData(latKey: String, lonKey: String, _ completion: @escaping ((Result<CurrentWeatherData>) -> Void)) {
        guard let url = URL(string: EndPoint.getWeatherDetail + EndPoint.latKey + latKey + EndPoint.lonKey + lonKey) else { return }
        load(Resource(url: url)) { (result) in
            switch result {
            case .success(let data):
                do {
                    let item = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                    completion(.success(item))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
