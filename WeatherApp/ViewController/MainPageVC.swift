//
//  MainPageVC.swift
//  WeatherApp
//
//  Created by Ahmet Mücahid BOZKURT on 16.07.2020.
//  Copyright © 2020 Ahmet Mucahid BOZKURT. All rights reserved.
//

import CoreLocation
import UIKit

class MainPageVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblLocationName: UILabel!
    @IBOutlet private weak var lblWeatherDescription: UILabel!
    @IBOutlet private weak var lblTemp: UILabel!
    @IBOutlet private weak var lblPressure: UILabel!
    @IBOutlet private weak var lblHumidity: UILabel!
    
    private let locationManager = CLLocationManager()
    
    private let currentWeatherService = WeatherService()
    private var currentWeatherDataArray: CurrentWeatherData? = nil {
        didSet {
            updateValues()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationStartUpdating()
        getCurrentDate()
        
    }
    
    private func getWeatherData(byLatKey: String, byLonKey: String) {
        currentWeatherService.getWeatherDetailsData(latKey: byLatKey, lonKey: byLonKey) { response in
            switch response {
            case.success(let data):
                self.currentWeatherDataArray = data
            case .failure(let error):
                Logger.debug(error)
            }
        }
    }
    
    private func updateValues() {
        DispatchQueue.main.async {
            guard let weatherDetail = self.currentWeatherDataArray else { return }
            self.lblLocationName.text = weatherDetail.name
            self.lblWeatherDescription.text = weatherDetail.weather.first?.description
            if let temp = weatherDetail.main?.temp {
                self.lblTemp.text = String(format: "%.0f", temp) + "°C"
            }
            if let pressure = weatherDetail.main?.pressure {
                self.lblPressure.text = String(pressure)
            }
            if let humidity = weatherDetail.main?.humidity {
                self.lblHumidity.text = String(humidity)
            }
            
        }
    }
    
    private func getCurrentDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let result = formatter.string(from: date)
        lblDate.text = result
    }
    
    private func locationStartUpdating() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first {
            locationManager.stopUpdatingLocation()
            let userLocation = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            getWeatherData(byLatKey: String(userLocation.latitude), byLonKey: String(userLocation.longitude))
        }
        
    }

}

