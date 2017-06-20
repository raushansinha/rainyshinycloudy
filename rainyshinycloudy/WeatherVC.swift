//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Raushan Sinha on 6/17/17.
//  Copyright © 2017 Raushan Sinha. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWetherImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts: [Forecast]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        forecasts = [Forecast]()
        
        print("Weather URL: " + CURRENT_WEATHER_URL);
        
        print("Forecast URL: " + FORECAST_URL);
        
        currentWeather.downloadWeatherDetails() {
            self.downloadForecastData() {
                //Update UI
                self.updateMainUI()
            }
        }
    }
    
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            print(response)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forcast = Forecast(forecastDict: obj)
                        self.forecasts.append(forcast)
                    }
                }
                self.tableView.reloadData()
            }
            
            // Alamofire.request(currentWeatherURL).responseJSON()
            completed()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forcast: forecast)
            return cell
        } else {
            return WeatherCell() // returns empty weather cell
        }
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        //return cell
    }
    
    func updateMainUI() {
        print("Date: " + currentWeather.date)
        dateLabel.text = currentWeather.date
        print("Temp: " + "\(currentWeather.currentTemp)")
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        print("W Type: " + currentWeather.weatherType)
        currentWeatherTypeLabel.text = currentWeather.weatherType
        print("City: " + currentWeather.cityName)
        locationLabel.text = currentWeather.cityName
        currentWetherImage.image = UIImage(named: currentWeather._weatherType)
    }
    
}

