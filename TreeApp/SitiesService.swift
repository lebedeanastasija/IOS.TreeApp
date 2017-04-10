//
//  SitiesService.swift
//  FriendAndWeather
//
//  Created by Senior Node on 18.03.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation
import SwiftyJSON

class SitiesService {
    private var cities: [String]! = []
    
    init() {
        let pathToJson = Bundle.main.path(forResource: "City", ofType: "json")
        
        do {
            let json = try String(contentsOfFile: pathToJson!, encoding: String.Encoding.utf8)
            print(json)
            parseJson(jsonString: json)
        } catch {
            return
        }
        
    }
    
    private func parseJson(jsonString: String) {
        if let data = jsonString.data(using: String.Encoding.utf8) {
            let json = JSON(data: data)
            for item in json["data"].arrayValue {
                self.cities.append(item.string!)
            }
        }
    }
    
    func getCities() -> [String] {
        return self.cities
    }
}
