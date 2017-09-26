//
//  WeatherMapTableViewCell.swift
//  VSCWeatherMap
//
//  Created by Mohamed Marouane YOUSSEF on 23/09/2017.
//  Copyright © 2017 Mohamed Marouane YOUSSEF. All rights reserved.
//

import UIKit

class VSCWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var weatherDate: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    var weatherItem : VSCWeatherItem? {
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
            let timeStamp  = weatherItem.timeStamp
            let date = Date(timeIntervalSince1970: Double(timeStamp))
            self.weatherDate.text = date.toString().capitalizingFirstLetter()
            
            let temp = weatherItem.temp
            let tempDay = temp.tempDay
            self.weatherTemperature.text = String(describing: tempDay) + "°"
            
            let weather = weatherItem.weather
            let weatherDescription = weather.weatherDescription
            self.weatherDescription.text = weatherDescription.capitalizingFirstLetter()
        
            let weatherIcon = weather.weatherIcon
            
            let productImageUrl = VSCRequestManager.generateIconUrlPath(weatherIcon)
            weatherIconImageView.vsc_setImage(withURL: productImageUrl, imageTransition: .crossDissolve(0.5), completion: {
                error in
                if error != nil {
                    
                }
            })
        }
    }
}
