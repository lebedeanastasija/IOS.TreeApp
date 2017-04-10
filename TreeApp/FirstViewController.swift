//
//  FirstViewController.swift
//  FriendAndWeather
//
//  Created by Senior Node on 15.02.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    private var friends: [User]!
    private var friendsService = FriendsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FriendsTable.dataSource = self;
        FriendsTable.delegate = self;
        self.friends = friendsService.getFriends()
    }
    
    @IBOutlet weak var FriendsTable: UITableView!
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.FriendsTable.dequeueReusableCell(withIdentifier: "friendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        let friend = self.friends[indexPath.row]
        
        ImageLoader.loadImage(url: friend.imageUrl!, imageView: cell.friendImage)
        cell.friendName.text = friend.name
        cell.friendShortDescription.text = friend.shortDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        self.performSegue(withIdentifier: "FriendDetailViewController", sender: friends[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "FriendDetailViewController") {
            let destination:FriendDetailViewController = segue.destination as! FriendDetailViewController            
            
            destination.friendData = sender as! User
        }
    }
}

