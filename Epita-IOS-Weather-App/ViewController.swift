//
//  ViewController.swift
//  Epita-IOS-Weather-App
//
//  Created by Youbaraj Poudel on 11/8/18.
//  Copyright © 2018 Boommba. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tablview: UITableView!
    var weatherArray:[Weather]=[
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeArray()
    }
    
    func  initializeArray(){
        let weather1=Weather.init(cityName: "Paris", windSpeed: 8, temperature: 7)
        let weather2=Weather.init(cityName: "Kathmandu", windSpeed: 8, temperature: 7)
        let weather3=Weather.init(cityName: "Mumbai", windSpeed: 8, temperature: 7)
        let weather4=Weather.init(cityName: "Paris", windSpeed: 8, temperature: 7)

        weatherArray.append(weather1)
        weatherArray.append(weather2)
        weatherArray.append(weather3)
        weatherArray.append(weather4)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?WeatherTableViewCell{
            cell.load(weatherArray[indexPath.row])
            return cell

        }
          return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

