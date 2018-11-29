//
//  WeatherTableViewCell.swift
//  Epita-IOS-Weather-App
//
//  Created by Youbaraj Poudel on 11/8/18.
//  Copyright © 2018 Boommba. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
 
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }
 
    func  loadView(_ weather : Weather){
        cityLabel.text=weather.cityName
        tempretureLabel.text=String(weather.temperature) + "°"
        windSpeedLabel.text=String(weather.windSpeed) + "km/h"
    }

}
