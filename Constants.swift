//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Raushan Sinha on 6/19/17.
//  Copyright © 2017 Raushan Sinha. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let API_ID = "&appid="
let API_KEY = "b1b15e88fa797225412429c1c50c122a1"

let FORECAST_BASE_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?"
let COUNT = "&cnt="
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(API_ID)\(API_KEY)"

let FORECAST_URL = "\(FORECAST_BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(COUNT)10\(API_ID)\(API_KEY)"
