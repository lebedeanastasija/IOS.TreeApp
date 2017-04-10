//
//  WeatherServise.swift
//  FriendAndWeather
//
//  Created by Senior Node on 18.03.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    let api_key = "a267ef668efbbc5f18cfe20be61b544f"
    let api: String
    
    init() {
        api = "http://api.openweathermap.org/data/2.5/weather?APPID=\(api_key)&units=metric&q="
    }
    
    func getWeather(city: String, temperatureLabel: UILabel) {
        Alamofire.request("\(api)\(city)").responseJSON { response in
            let json = JSON(data: response.data!)
            print(json);
            temperatureLabel.text = "\(json["main"]["temp"]) C"
        }
    }
}
