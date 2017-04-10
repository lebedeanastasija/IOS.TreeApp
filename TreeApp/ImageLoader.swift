//
//  ImageLoader.swift
//  FriendAndWeather
//
//  Created by Senior Node on 15.03.17.
//  Copyright © 2017 BSUIR. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class ImageLoader {
    static func loadImage(url: String, imageView: UIImageView) {
        print("Start load \(url)")
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let documentsURL = URL(fileURLWithPath: documentsPath, isDirectory: true)
            let fileURL = documentsURL.appendingPathComponent("image.png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(url, to: destination).responseData { response in
            print("Response from \(url)")
            if let data = response.result.value {
                imageView.image = UIImage(data: data)
            }
        }
    }
}

