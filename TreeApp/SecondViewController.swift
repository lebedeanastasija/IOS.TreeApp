//
//  SecondViewController.swift
//  FriendAndWeather
//
//  Created by Senior Node on 15.02.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import UIKit
import SwiftyJSON

class SecondViewController: UIViewController, UITableViewDataSource {
    
    private var cities: [String]!
    private var citiesServise = SitiesService()
    private var weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherTable.dataSource = self
        self.cities = citiesServise.getCities()
    }
    
    @IBOutlet weak var WeatherTable: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.WeatherTable.dequeueReusableCell(withIdentifier: "weatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        
        let city = self.cities[indexPath.row]
        cell.citiName.text = city
        print(city)
        weatherService.getWeather(city: city, temperatureLabel: cell.citiTemperature)
        
        return cell
    }

}

//a267ef668efbbc5f18cfe20be61b544f
