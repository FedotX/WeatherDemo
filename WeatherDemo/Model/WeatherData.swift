//
//  WeatherData.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

import Foundation

struct WeatherData: Decodable, Identifiable {
    var id: Int
    var name: String
    var weather: [Weather]
    var main: Main
    
    struct Weather: Decodable, Identifiable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    
    struct Main: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
    }
}
