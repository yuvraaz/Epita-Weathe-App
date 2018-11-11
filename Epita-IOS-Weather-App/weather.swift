//
//  weather.swift
//  Epita-IOS-Weather-App
//
//  Created by Youbaraj Poudel on 11/8/18.
//  Copyright © 2018 Boommba. All rights reserved.
//

import Foundation

class Weather {
    var cityName: String
    var windSpeed: Int
    var temperature: Int
    
    init(cityName: String, windSpeed: Int, temperature: Int) {
        self.cityName = cityName
        self.windSpeed=windSpeed
        self.temperature=temperature
    }
    
}
