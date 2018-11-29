//
//  ViewController.swift
//  Epita-IOS-Weather-App
//
//  Created by Youbaraj Poudel on 11/8/18.
//  Copyright © 2018 Boommba. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var weatherArray:[Weather]=[]
    var currentWeather:Weather?
    let cityNames:[String]=["kathmandu,np","chennai,in","paris,fr"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         for city in cityNames{
            getContent(cityname: city)
        }
 
    }
    
    func  initializeArray(){
        let weather1=Weather.init(cityName: "Paris", windSpeed: 8, temperature: 7)
        let weather2=Weather.init(cityName: "Kathmandu", windSpeed: 8, temperature: 12)
        let weather3=Weather.init(cityName: "Mumbai", windSpeed: 8, temperature: 7)
        

        weatherArray.append(weather1)
        weatherArray.append(weather2)
        weatherArray.append(weather3)
 

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?WeatherTableViewCell{
            cell.loadView(weatherArray[indexPath.row])
            return cell

        }
          return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //define when i touch or select item on the list
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentWeather=weatherArray[indexPath.row]
        performSegue(withIdentifier: "detail_segue", sender: self)
    }

    //for api call
    func getContent(cityname city:String){
        let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=32eae934a11df289cec429e392718445")
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
            guard let json = (try?  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("Not containing JSON")
                return
            }
            print(json)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    //function for defining seuge(Connector we defined)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail_segue"{
            let detailViewController=segue.destination as? DetailViewController
            detailViewController?.weather=currentWeather
        }
    }
}

