//
//  CityList.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

import SwiftUI

struct CityList: View {
    @EnvironmentObject var weather: WeatherResponse
    @State var weatherData: WeatherData
    @State var cityName = ""
    @State var citis: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add a new city", text: $cityName)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        weather.city = cityName
                        citis.append(cityName)
                        Task {
                            let result = try await WeatherResponse().getWeather(city: cityName)
                            self.weatherData = result
                        }
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title3)
                    }
                    
                }
                .padding()
                
                List {
                    CityCell(weatherData: weatherData)
                }
            }
            .navigationTitle("City list")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList(weatherData: previewWeather)
    }
}
