//
//  File.swift
//  FriendAndWeather
//
//  Created by Senior Node on 18.03.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation
import UIKit

class FriendDetailViewController: UIViewController {
    
    var friendData: User!
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendFullDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendName.text = friendData.name
        friendFullDescription.text = friendData.fullDescription
        ImageLoader.loadImage(url: friendData.imageUrl!, imageView: friendImage)
    }
}
