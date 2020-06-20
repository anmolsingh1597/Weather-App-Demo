//
//  WeatherManager.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class WeatherURLManager {
    
    /// create a URL from string
    /// - Parameter city: city name in string
    /// - Returns: URL
    
    static func getCityWeatherURL(for city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=66fd7e6224d12a2784778054bdbeeb71"
        
        return URL(string: urlString)
    }
    
    /// create a URL for icon
    /// - Parameter iconCode: icon code in string
    /// - Returns: URL
    static func getWeatherIconURL(iconCode: String) -> URL?{
        let urlString = "https://openweathermap.org/img/wn/\(iconCode).png"
        return URL(string: urlString)
    }
    
    /// create a URL for icon
    /// - Parameter city: icon code in string
    /// - Returns: URL
    
    static func getForecastWeatherURL(city: String) -> URL?{
        
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=66fd7e6224d12a2784778054bdbeeb71"
               
        return URL(string: urlString)
    }
    
}

// class method is method belongs to class itself

