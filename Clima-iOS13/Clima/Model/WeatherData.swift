//
//  WeatherData.swift
//  Clima
//
//  Created by Şahin Yürek on 3/16/23.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
