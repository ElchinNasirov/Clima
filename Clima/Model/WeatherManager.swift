//
//  WeatherManager.swift
//  Clima
//
//  Created by Elchin Nasirov on 2/25/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithErrore(error: Error)
}
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1d2c4e7534b0fe8ceceff91d6a1a30a6&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        //Not adding self. when calling a function because the function is inside the WeatherManager() struct
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        //1. Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task            closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithErrore(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                    //Adding self. when calling a function because it's inside the closure
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }

                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    //Parsing the data in JSON format
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
            print(weather.conditionName)
        } catch {
            self.delegate?.didFailWithErrore(error: error)
            return nil
        }
    }
}
