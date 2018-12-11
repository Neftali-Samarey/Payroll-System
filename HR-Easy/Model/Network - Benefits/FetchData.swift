//
//  ServedData.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 10/11/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit
import Foundation

protocol fetchedDataProtocol: class {
    func itemsDownloaded(items: NSArray)
    func itemsDidDownloadFromServer(didDownload: Bool)
}

class FetchData: NSObject, URLSessionDataDelegate {
    
    weak var delegate : fetchedDataProtocol!
    
    var data = Data()
    let urlPath = "http://freehreasy.com/BenefitsDataAPI.php"

    func downloadDataFromServer() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        // Checking to see if the main data is being dowloaded
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed to download data")
                self.delegate.itemsDidDownloadFromServer(didDownload: false) // send this delegate to the delegator
            }else {
                print("Benefits data downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let dataModel = BHBenefits()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["name"] as? String,
            let rate = jsonElement["percentage"] as? String
//                let name = jsonElement["name"] as? String,
//                let type = jsonElement["type"] as? String,
//                let percentage = jsonElement["percentage"] as? Float
            {
                
                dataModel.planName = name
                dataModel.percentage = rate
//                dataModel.planName = name
//                dataModel.planType = type
//                dataModel.percentage = percentage
                
//                print("RAW: \(rate)")
                
            }
            locations.add(dataModel)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
    
        })
    }
    
    
}
