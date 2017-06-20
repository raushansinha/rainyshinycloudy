//
//  forecast.swift
//  rainyshinycloudy
//
//  Created by Raushan Sinha on 6/19/17.
//  Copyright © 2017 Raushan Sinha. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date;
    }
    
    var wethreType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType;
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp;
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp;
    }
    
    init(forecastDict: Dictionary<String, AnyObject>) {
        if let temp = forecastDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                let kelvinToFarenheit = Double(round((min * (9/5) - 459.67)))
                self._lowTemp = "\(kelvinToFarenheit)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToFarenheit = Double(round((max * (9/5) - 459.67)))
                self._highTemp = "\(kelvinToFarenheit)"
            }
        }
        
        if let weather = forecastDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let weatherType = weather[0]["main"] as? String {
                self._weatherType = weatherType.capitalized
            }
        }
        
        if let date = forecastDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
