//
//  WeatherResponse.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

import Foundation


class WeatherResponse: ObservableObject {
    @Published var city = ""
    
    func getWeather(city: String) async throws -> WeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=dd9afdf364488c4343ee964e5463254b&units=metric") else { throw "Bad URL" as! Error }
        print(url)
        let data = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(WeatherData.self, from: data.0)
        return result
    }
}

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
