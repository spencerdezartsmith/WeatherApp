//
//  ViewController.swift
//  Weather App
//
//  Created by spencerdezartsmith on 1/5/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedCity: NSString = ""

    @IBOutlet var cityTextInput: UITextField!
    
    @IBOutlet var forecastPlaceholder: UILabel!
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        
        let optionalString = cityTextInput.text
        
        if let unwrappedString = optionalString {
            
            let tempString = NSString(string: unwrappedString)
            
            // Check to make sure the string is formatted correctly
            
            if tempString.contains(" ") {
                
                selectedCity = tempString.replacingOccurrences(of: " ", with: "-") as NSString
                print(selectedCity)
                
            } else {
                
                selectedCity = tempString as NSString
                
            }
            
            // Set up the call to the weather page
            
            if let url = URL(string: "http://www.weather-forecast.com/locations/\(selectedCity)/forecasts/latest") {
                
                let request = NSMutableURLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    
                var forecastData = ""
                    
                    if error != nil {
                        
                        print("The following error occurred: \(error)")
                        
                        self.forecastPlaceholder.text = "Sorry there was no data found for that city. Please try again"
                        
                    } else {
                        
                        if let unwrappedData = data {
                            
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                                
                            var stringSeperator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                            
                            if let contentArray = dataString?.components(separatedBy: stringSeperator) {
                                
                                if contentArray.count > 0 {
                                    
                                    stringSeperator = "</span>"
                                    
                                    let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                                    
                                    if newContentArray.count > 0 {
                                        
                                        forecastData = newContentArray[0]
                                        
                                        DispatchQueue.main.sync(execute: {
                                            
                                            self.forecastPlaceholder.text = forecastData
                                            
                                        })
                                        
                                    }
                                    
                                }
                                
                                
                            }
                                
                            
                        }
                        
                    }
                    
                    
                }
                
                task.resume()
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

