//
//  WeatherManager.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class WeatherURLManager {
    class func getCityWeatherURL(for city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=66fd7e6224d12a2784778054bdbeeb71")
        
        return urlString
    }
}

// class method is method belongs to class itself

