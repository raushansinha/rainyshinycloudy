//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Raushan Sinha on 6/19/17.
//  Copyright © 2017 Raushan Sinha. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    func configureCell(forcast: Forecast) {
        lowTemp.text = forcast.lowTemp
        highTemp.text = forcast.highTemp
        weatherType.text = forcast.wethreType
        weatherImage.image = UIImage(named: forcast.wethreType)
        dayLabel.text = forcast.date
    }

}
