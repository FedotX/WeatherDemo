//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var weather: WeatherResponse
    @State var weatherData: WeatherData
    @State var cityName = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    TextField("Write your city...", text: $cityName)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        weather.city = cityName
                        Task {
                            let result = try await WeatherResponse().getWeather(city: cityName)
                            self.weatherData = result
                        }
                    } label: {
                        Text("OK")
                    }
                }
                .padding()
                
                Text(weatherData.name)
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\( weatherData.weather[0].icon)@2x.png"), content: { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                }, placeholder: {
                    ProgressView()
                })
                Text("\(weatherData.weather[0].main)")
                    .font(.title3)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(weatherData.main.temp.roundDouble())º")
                        Text("Current")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        VStack {
                            Text("\(weatherData.main.temp_max.roundDouble())º")
                            Text("Temp max.")
                                .font(.subheadline)
                        }
                        VStack {
                            Text("\(weatherData.main.temp_min.roundDouble())º")
                            Text("Temp min.")
                                .font(.subheadline)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(weatherData.main.feels_like.roundDouble())º")
                        Text("Feels like")
                            .font(.subheadline)
                    }
                }
                .padding()
                .font(.title)
                
                Spacer()
                
                // TODO: Переход на неиспользуемое View. Список городов
                //                NavigationLink {
                //                    CityList(weatherData: weatherData)
                //                } label: {
                //                    Image(systemName: "list.bullet")
                //                    Text("City List")
                //                }
                //                .foregroundColor(.black)
                //                .font(.body)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.623, saturation: 0.139, brightness: 0.99))
            .onAppear {
                Task {
                    let result = try await WeatherResponse().getWeather(city: weather.city)
                    self.weatherData = result
                }
            }
        }
    }
}

// MARK: Ошибка preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(weatherData: previewWeather)
//    }
//}
