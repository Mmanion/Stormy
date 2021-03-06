//
//  ViewController.swift
//  Stormy
//
//  Created by Matthew Manion on 8/25/15.
//  Copyright (c) 2015 Matthew Manion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var sunriseTimeLabel: UILabel?
    @IBOutlet weak var sunsetTimeLabel: UILabel?
    @IBOutlet weak var lowTemperatureLabel: UILabel?
    @IBOutlet weak var highTemperatureLabel: UILabel?
    @IBOutlet weak var precipitationLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    
    
    

    
    var dailyWeather: DailyWeather?{
    didSet {
    configureView()
        }
    }
    
    func configureView() {
        if let weather = dailyWeather {
            // Update UI with information from the data model
            weatherIcon?.image = weather.largeIcon
            summaryLabel?.text = weather.summary
            sunriseTimeLabel?.text = weather.sunriseTime
            sunsetTimeLabel?.text = weather.sunsetTime
            
            if let lowTemp = weather.minTemperature,
            let highTemp = weather.maxTemperature,
            let rain = weather.precipChance,
            let humidity = weather.humidity {
                lowTemperatureLabel?.text = "\(lowTemp)º"
                highTemperatureLabel?.text = "\(highTemp)º"
                precipitationLabel?.text = "\(humidity)%"
            }
            self.title = weather.day
            
            
            
            
            
        }
        
        // Change the font and size of nav bar text
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let barButtonAttributesDictionary: [String: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: buttonFont
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, forState: .Normal)
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}

