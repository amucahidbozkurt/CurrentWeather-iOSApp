//
//  APIClient.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

class APIClient {
    
    func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIClientError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            result(.success(data))
        }
        task.resume()
    }
    
}
