//
//  ForecastTableViewCell.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-20.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var highLbl: UILabel!
    @IBOutlet weak var lowLbl: UILabel!
    @IBOutlet weak var feelsLbl: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setForecast(forecast: ForecastData) {
        dateLbl.text = forecast.dateString
        timeLbl.text = forecast.hour
        
        tempLbl.text = forecast.dayTemp
        highLbl.text = forecast.highTemp
        lowLbl.text = forecast.lowTemp
        feelsLbl.text = forecast.feelTemp
        
        loadImage(with: forecast.iconCode)
    }

    func loadImage(with iconCode: String) {
        if let iconURL = WeatherURLManager.getWeatherIconURL(iconCode: iconCode){
            let session = URLSession.shared
            let task = session.dataTask(with: iconURL) { (data, response, error) in
                if data != nil{
                    DispatchQueue.main.async {
                        self.iconImage.image = UIImage(data: data!)
                    }
                }
            }
            task.resume()
        }
    }
}
