//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    @StateObject var weather = WeatherResponse()
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData: previewWeather)
                .environmentObject(weather)
        }
    }
}
