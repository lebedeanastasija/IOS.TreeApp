//
//  FriendsServise .swift
//  FriendAndWeather
//
//  Created by Senior Node on 08.03.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation
import SwiftyJSON

class FriendsService {
    private var friends: [User]! = []
    
    init() {
        let path: String = Bundle.main.path(forResource: "Data", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as Data!
        
        do {
            let readableJSON = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            parseJson(readableJSON: readableJSON)
        } catch {
            print("Error getting json")
        }
    }
    
    func parseJson(readableJSON: NSDictionary) {
        let userArray = readableJSON.value(forKey: "user") as! [NSObject]
        
        
        for jsonUser in userArray {
            let name = jsonUser.value(forKey: "name") as! String
            let shortDescription = jsonUser.value(forKey: "shortDescription") as! String
            let fullDescription = jsonUser.value(forKey: "fullDescription") as! String
            let imageUrl = jsonUser.value(forKey: "imageUrl") as! String
            
            let user = User(name: name, shortDescription: shortDescription, fullDescription: fullDescription, imageUrl: imageUrl)
            self.friends.append(user)
        }
        
        for friend in self.friends {
            NSLog("\(friend.name)")
        }
    }
    
    func getFriends() -> [User] {
        print(self.friends[0])
        return self.friends
    }
}
