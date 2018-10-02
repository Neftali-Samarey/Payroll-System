//
//  EmployeeTableViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/25/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    
    
    var employeeData = SampleUserbase()
    var detailController : EmployeeDetailViewController? = nil
    var tableArray = [String] ()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employees"
        parseJson()
        self.extendedLayoutIncludesOpaqueBars = true
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? EmployeeDetailViewController
        }
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func parseJson() {
        
        let url = URL(fileURLWithPath: "http://api.myjson.com/bins/vi56v")
        let task = URLSession.shared.dataTask(with: url) {(data, response, error ) in
            guard error == nil else {
                print("1. returned error")
                return
            }
            
            if error != nil {
                
            }else {
                print("2. returned error")
            }
            
            guard let content = data else {
                
                print("No data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            
            if let array = json["companies"] as? [String] {
                self.tableArray = array
            }
            
            print(self.tableArray)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
            
            
        }
        
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return employeeData.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! EmployeeTableViewCell
        
        // bind the entity to the main user
        cell.employeeProfileImageView?.layer.cornerRadius = (cell.employeeProfileImageView?.frame.height)!/2
        
        
        let entity = employeeData.users[indexPath.row].name
        let position = employeeData.users[indexPath.row].role // revise **
        let imageview = employeeData.users[indexPath.row].profileImage // profile image
        cell.employeeFullNameLabel.text = entity
        cell.employeeJobFunctionLabel.text = "\(position!)"
        cell.employeeProfileImageView.image = UIImage(named: imageview as String)
//        cell.employeeFullNameLabel.text = tableArray[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showDetail", sender: self)
//        let selectedEntity = employeeData.users[indexPath.row].name!
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            print("Selected")
            if let indexPath = tableView.indexPathForSelectedRow {
                let entitySelected = employeeData.users[indexPath.row].name!
                let controller = (segue.destination as! UINavigationController).topViewController as! EmployeeDetailViewController
                
                controller.title = entitySelected
                
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

   
 
    
    
    
    // MARK: - Method to add people
    @IBAction func addEmployee() {
        
        // sample database
//        let person1 = Person(personName: "Andrea", personLastname: "Murcia", ssn: 29102922, userRole: .HumanResource, employed: true, image: "")
//        self.employeeData.append(person1)
    
        tableView.reloadData()
        
    }

}
