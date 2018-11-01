//
//  AddUserTableViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 10/8/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class AddUserTableViewController: UITableViewController {
    
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var addressfield: UITextField!
    @IBOutlet weak var dobfield: UITextField!
    @IBOutlet weak var ssnfield: UITextField!
    @IBOutlet weak var sexSelection: UISegmentedControl!
    
    var isConnecting = true

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
   
    
    @IBAction func dismissController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

extension UIViewController {
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
