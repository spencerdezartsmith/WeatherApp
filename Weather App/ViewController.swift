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
            
            selectedCity = NSString(string: unwrappedString)
            
            
            
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

