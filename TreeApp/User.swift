//
//  User.swift
//  FriendAndWeather
//
//  Created by Senior Node on 24.02.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation

class User {
    var name: String?
    var shortDescription: String?
    var fullDescription: String?
    var imageUrl: String?
    
    init(name: String, shortDescription: String, fullDescription: String, imageUrl: String) {
        self.name = name;
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
        self.imageUrl = imageUrl
    }
}
