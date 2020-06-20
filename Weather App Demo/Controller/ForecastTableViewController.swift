//
//  ForecastTableViewController.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-20.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {
    
    var cityName: String!
    var forecasts: [ForecastData]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setCity(city: String) {
        cityName = city
        self.title = city
        
        //url
        if let forecastURL = WeatherURLManager.getForecastWeatherURL(city: city) {
            //session
            let session = URLSession.shared
            
            //task
            let task = session.dataTask(with: forecastURL) { (data, response, error) in
                if data != nil {
                    if let forecastData = try? JSON(data: data!){
                        self.loadForecast(data: forecastData)
//                        print(forecastData)
                    }
                }
            }
            // task
            task.resume()
        }
    }
    
    // load forecast
    func loadForecast(data: JSON) {
        forecasts = [ForecastData]()
        let forecastList = data["list"].arrayValue
        
        for jsonItem in forecastList{
            forecasts.append(ForecastData(city: cityName, data: jsonItem))
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return forecasts?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as! ForecastTableViewCell
        
        cell.setForecast(forecast: forecasts[indexPath.row])

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
