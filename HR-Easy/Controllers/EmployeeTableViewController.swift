//
//  EmployeeTableViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/25/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController, ServedDataProtocol{
    
    
    var employeeData = SampleUserbase()
    var detailController : EmployeeDetailViewController? = nil
    var tableArray = [String] ()
    var employeeCount = 0
    
    var screenHeight : CGFloat?
    var screenWidth : CGFloat?
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : UserModel = UserModel()
    
    
    lazy var refreshTableControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(EmployeeTableViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchDataFromSQLServer()
        self.employeeCount = feedItems.count
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeScreenDimensions()
        self.extendedLayoutIncludesOpaqueBars = true
        // Delegates
       fetchDataFromSQLServer()
        self.tableView.addSubview(refreshTableControl)
    }
    
    
    // DELEGATES
    
    func fetchDataFromSQLServer() {
        let downloadModel = ServedData()
        downloadModel.delegate = self
        downloadModel.downloadDataFromServer()
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.employeeCount = self.feedItems.count
        self.tableView.reloadData()
    }
    
    func itemsDidDownloadFromServer(didDownload: Bool) {
        guard didDownload else {
            print("No Data downloaded from the server")
            errorDropdown()
        
            return
        }
        // Some data then downloads from the server
    }
    
    
    
    
    func initializeScreenDimensions() {
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        //return employeeData.users.count
        return feedItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! EmployeeTableViewCell
        
        // bind the entity to the main user
        cell.employeeProfileImageView?.layer.cornerRadius = (cell.employeeProfileImageView?.frame.height)!/2
        
        
        // TODO; CHECK IMAGES
       /* let entity = employeeData.users[indexPath.row].name
        let position = employeeData.users[indexPath.row].role // revise **
        let imageview = employeeData.users[indexPath.row].profileImage // profile image
        cell.employeeFullNameLabel.text = entity
        cell.employeeJobFunctionLabel.text = "\(position!)"
        cell.employeeProfileImageView.image = UIImage(named: imageview as String) */
//        cell.employeeFullNameLabel.text = tableArray[indexPath.row]
       
        let entity : UserModel = feedItems[indexPath.row] as! UserModel
        
        cell.employeeFullNameLabel.text = entity.name
        cell.employeeJobFunctionLabel.text = entity.position
        if entity.gender == "Male" {
            cell.employeeProfileImageView.image = UIImage(named: "alx.jpg") // override the main
        } else if entity.gender == "Female"  {
             cell.employeeProfileImageView.image = UIImage(named: "user.jpg")
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        //self.performSegue(withIdentifier: "showDetail", sender: self)
       
//        let selectedEntity = employeeData.users[indexPath.row].name!
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        fetchDataFromSQLServer()
        self.title = "\(employeeCount) Employees"
        print("Number of Employees: \(employeeCount)")
    }
 
  

    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            print("Selected")
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let selectedEmployee : UserModel = feedItems[indexPath.row] as! UserModel
                
                
               // let entitySelected = employeeData.users[indexPath.row].name!
                let controller = (segue.destination as! UINavigationController).topViewController as! EmployeeDetailViewController
                controller.title = selectedEmployee.name
                controller.person.name = selectedEmployee.name
                controller.person.lastName = selectedEmployee.lastname
                controller.person.postion = selectedEmployee.position
                controller.person.gender = selectedEmployee.gender
                controller.person.dob = selectedEmployee.dob
                
                controller.didSelectAnotherUser = true
                controller.slideViewWithData()
                controller.doesHaveData = true
                
                
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
        self.showModalControllerView()
    }
    
    // MARK: - ERROR DIALOG NOT IN USE
    fileprivate func errorDialog() {
        let errorController = UIAlertController.init(title: "No Internet", message: "There was an error fetching data from the server", preferredStyle: .alert)
        let controllKey = UIAlertAction.init(title: "Ok", style: .default) { (Void) in
            //
        }
        errorController.addAction(controllKey)
     
        self.show(errorController, sender: self)
    }

    fileprivate func showModalControllerView() {
      
    }
    
    
    // FIXME: DIALOG CONTROLLER NEEDS TO BE DIALLOCATED FOR EVERY CALL THAT IS MADE
    
    fileprivate func errorDropdown() {
        
        // This is switching to the main thread in the async queue. Working aleady. don't touch it nef
        DispatchQueue.main.async {
            let overlayView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: self.tableView.bounds.height))
            overlayView.backgroundColor = UIColor.clear
            overlayView.isUserInteractionEnabled = false
            self.view.addSubview(overlayView)
            //self.tableView.addSubview(overlayView)
        
            // main label and view for the dialog itself in the view
            let resetPassview = UIView(frame: CGRect(x: 10, y: -50, width: self.view.bounds.width - 20, height: 40))
            var contactText = UILabel(frame: CGRect(x: 0, y: 0, width: resetPassview.bounds.width, height: 40))
            resetPassview.layer.cornerRadius = 8
            resetPassview.backgroundColor = UIColor.red
            contactText.text = "Not connected to the internet"
            contactText.textColor = UIColor.white
            contactText.textAlignment = .center
            
            
            // animate this and then discard the notification
           
            
            UIView.animate(withDuration: 0.3, animations: {
                // code
                resetPassview.center.y = 40
                overlayView.addSubview(resetPassview)
                resetPassview.addSubview(contactText)
            }, completion: { (true) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    
                    UIView.animate(withDuration: 0.3) {
                        resetPassview.center.y = -50
                    }
                    
//                    if resetPassview.center.y < -50 {
//                    resetPassview.removeFromSuperview()
//                    overlayView.removeFromSuperview()
//                    contactText.removeFromSuperview()
//                    }
                }
            

            })
            
            
            
           
        
        }
    }
    
    
    
    fileprivate func createErrorDiallog() {
        
        //let app  = UIApplication.shared.delegate? // not used as of now
        let errorSlideDown = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 140))
        errorSlideDown.layer.backgroundColor = UIColor.red.cgColor
        errorSlideDown.center.y = -100
        
        // slide the view down
        UIView.animate(withDuration: 0.3, animations: {
            // animate this from the origin
        errorSlideDown.center.y += 80
        
       // self.tableView.addSubview(errorSlideDown)
           
        }) { (true) in
            // completion handler
        }
        self.view.layoutIfNeeded()
    }
    
    
    

}
extension UIViewController {

}
