//
//  ServedData.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 10/11/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit
import Foundation

protocol ServedDataProtocol: class {
    func itemsDownloaded(items: NSArray)
    func itemsDidDownloadFromServer(didDownload: Bool)
  
}

class ServedData: NSObject, URLSessionDataDelegate {

    weak var delegate : ServedDataProtocol!
    
    var data = Data()
    let urlPath = "http://freehreasy.com/webservice.php"
 

    func downloadDataFromServer() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
                self.delegate.itemsDidDownloadFromServer(didDownload: false) // send this delegate to the delegator
            }else {
                print("Data downloaded")
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
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let model = UserModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["iden"] as? String,
                let name = jsonElement["firstName"] as? String,
                let role = jsonElement["position"] as? String,
                let salary = jsonElement["salary"] as? String,
                let lastName = jsonElement["lastName"] as? String,
                
                let gender = jsonElement["gender"] as? String,
                let dob = jsonElement["dob"] as? String,
                let maritalStatus = jsonElement["maritalStatus"] as? String,
                let socialsecurity = jsonElement["ssn"] as? String,
                let dependentsCount = jsonElement["dependants"] as? String,
                let org = jsonElement["organization"] as? String,
                let department = jsonElement["department"] as? String,
                let startDate = jsonElement["startDate"] as? String,
                let hoursWorked = jsonElement["weekhours"] as? String
                
                
            {
                
                model.id = id
                model.name = name
                model.position = role
                model.salary = salary
                model.lastname = lastName
                model.gender = gender
                model.dob = dob
                model.maritalStatus = maritalStatus
                model.ssn = socialsecurity
                model.dependents = dependentsCount
                model.organization_2 = org
                model.dept = department
                model.start = startDate
                model.hoursWorked = hoursWorked
                
            print("RAW: \(lastName)")
                
            }
            
            locations.add(model)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }

    
}
