//
//  CityTableViewCell.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var temperatureLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCity(to city: String){
        cityLbl.text = city
        
        // creating = weatherURL
        if let weatherURL = WeatherURLManager.getCityWeatherURL(for: city){
            
            //create a session
            let session = URLSession.shared
            
            // create a task
            let task = session.dataTask(with: weatherURL) { (data, response, error) in
                if data != nil {
                    //load temprature
                    if let weatherData = try? JSON(data: data!) {
                        let tempValue = weatherData["main"]["temp"].intValue
                        self.loadIcon(with: weatherData)
//                        print(weatherData)
                        // update UI
                        DispatchQueue.main.async {
                            self.temperatureLbl.text = "\(tempValue)º"
//                            print(tempValue)
                            
                        }
                    }
                }
            }
            
            // start a task
            task.resume()
        }
        
    }
    

    func loadIcon(with weatherData: JSON) {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
        
        // passing icon code to get weather icon url method
        if let iconURL = WeatherURLManager.getWeatherIconURL(iconCode: iconCode){
            // create session
            let session = URLSession.shared
            
            // task
            let task = session.dataTask(with: iconURL) { (data, response, error) in
                if let data = data {
                DispatchQueue.main.async {
                    self.imageCell.image = UIImage(data: data)
                    }
                }
            }
            //start the task
                task.resume()
            
        }

        
        
    }
    
}



/// if let .......{
///optional binding
///}
