//
//  WeatherManager.swift
//  Clima
//
//  Created by Elchin Nasirov on 2/25/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=1d2c4e7534b0fe8ceceff91d6a1a30a6&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
}
