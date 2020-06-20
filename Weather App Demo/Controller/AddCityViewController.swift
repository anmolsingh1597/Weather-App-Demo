//
//  ViewController.swift
//  Weather App Demo
//
//  Created by Anmol singh on 2020-06-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//MARK: Networking
    @IBAction func addCity(_ sender: UIButton) {
        
//------------------------------------------------------------------//
 /*
        // Step 1: create URL
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(self.cityTextField.text!.replacingOccurrences(of: " ", with: "%20"))&appid=66fd7e6224d12a2784778054bdbeeb71"){
        // Step 2: create URLsession [like a browser]
        let urlSession = URLSession.shared
        
        // Step 3: give the urlSession a task to do
            let task = urlSession.dataTask(with: url) {(data, response, error)in
                if let error = error {
                    print(error)
                }else {
                    if let dataValue = data {
                        // data is of type JSON
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: dataValue, options: JSONSerialization.ReadingOptions.mutableContainers)  as? NSDictionary
                            
                        print("JSON: \(jsonResult!)")
                            if let description = ((jsonResult?["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                print(description)
                            }
                        }catch {
                            print(error)
                        }
                    }
                }
            }
        
        // Step 4: Start the task
        task.resume()
        }
        

    
*/
//------------------------------------------------------------------//
        cities?.append(cityTextField.text!.capitalized)
       
}

}
