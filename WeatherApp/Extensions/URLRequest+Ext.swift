//
//  URLRequest+Ext.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 17.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import Foundation

extension URLRequest {

    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }

}
