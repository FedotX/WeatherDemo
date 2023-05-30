//
//  CityCell.swift
//  WeatherDemo
//
//  Created by Святослав Федотов on 26.05.2023.
//

// MARK: Не используемое view, см. CityList

import SwiftUI

struct CityCell: View {
    @EnvironmentObject var weather: WeatherResponse
    @State var weatherData: WeatherData
    
    var body: some View {
        HStack {
            Text(weatherData.name)

            Spacer()
            
            let url = URL(string: "https://openweathermap.org/img/wn/\(weatherData.weather[0].icon)@2x.png")
            
            AsyncImage(url: url, content: { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
            }, placeholder: {
                ProgressView()
            })
            Text("\(weatherData.main.temp.roundDouble())º")
        }
        
    }
}

struct CityCell_Previews: PreviewProvider {
    static var previews: some View {
        CityCell(weatherData: previewWeather)
    }
}
