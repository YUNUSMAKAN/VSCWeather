//
//  VSCCurrentWeatherView.swift
//  VSCWeatherForecast
//
//  Created by Mohamed Marouane YOUSSEF on 24/09/2017.
//  Copyright © 2017 Mohamed Marouane YOUSSEF. All rights reserved.
//

import UIKit

class VSCCurrentWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var citryName: UILabel!
    @IBOutlet weak var weatherTemperatureMax: UILabel!
    @IBOutlet weak var weatherTemperatureMin: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    @IBOutlet weak var weatherhumidity: UILabel?
    @IBOutlet weak var weatherPressur: UILabel?
    @IBOutlet weak var weatherDescription: UILabel!
    
    var weatherItem : VSCCurrentWeather? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateView() {
        if let weatherItem = weatherItem {
            
            if let weatherhumidity = weatherhumidity {
                let humidity  = weatherItem.humidity
                weatherhumidity.text = String(describing: humidity) + "%"
            }
            
            let tempMax  = weatherItem.tempMax
            self.weatherTemperatureMax.text = String(describing: Int(tempMax)) + "°"
            
            let tempMin  = weatherItem.tempMin
            self.weatherTemperatureMin.text = String(describing: Int(tempMin)) + "°"

            let temp  = weatherItem.temp
            self.weatherTemperature.text = String(describing: Int(temp)) + "°"
            
            if let weatherPressur = weatherPressur {
                let pressure  = weatherItem.pressure
                weatherPressur.text = String(describing: pressure) + "hPa"
            }
            
            let weather = weatherItem.weather
            let weatherDescription = weather.weatherDescription
            self.weatherDescription.text =  weatherDescription.capitalizingFirstLetter()
            
            if let weatherIcon = weatherIcon {
                let weather = weatherItem.weather
                let weatherIconName = weather.weatherIcon
                VSCRequestManager.sharedInstance.loadIconWeatherMap(weatherIconName, success: { (icon) in
                    weatherIcon.image = icon
                }, error: { (error) in
                    weatherIcon.image = UIImage(named: "empty_Image")
                })
            }
        }
        
    }
}
