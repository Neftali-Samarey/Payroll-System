//
//  ReportViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 11/6/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, LineChartDelegate {
    
    var isOnline = false

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var benefitsTable: UITableView!
    
    let sample = ["HealthFirst", "EmblemHealth", "MVP Healthcare", "Oscar Health"]
    
    var lineChart: LineChart!
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadLineChart()
        benefitsTable.delegate = self
        benefitsTable.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !isUserOnline() {
           // this will enable the drop down to occur
        }
    }
    
    // MARK: - Line chart
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReportViewController {
    
    func loadLineChart() {
        
        var views: [String: AnyObject] = [:] // setting it to the next available view
        
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.mainView.addSubview(label)
        views["label"] = label
        self.mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        self.mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[label]", options: [], metrics: nil, views: views))
        
        // testing this only to see if the actual data is inact to dsiplaying all collection numbeers
        var testArray = [Int]()
        for n in 1...10  {
            testArray.append(n) // appending the new elements in from the array thru iteration
            print("Numbers iteration: \(n)")
        }
        
        let startDay: [CGFloat] = [10, 9, 8, 6, 5, 4, 2]
        //let endDay  : [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        let xLabels: [String] = ["Humana", "Oscar", "United Healthcare", "Guardian", "EmblemHealth", "Cygna", "MVP Healthcare"]
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 7
        lineChart.y.grid.count = 6
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.addLine(startDay)
        lineChart.overrideBaseColorsWith(colorSelected: UIColor.cleanWhite())
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.clipsToBounds = true
        lineChart.delegate = self   // nmzbmbMJnm <--(my baby typed this)
        
        self.mainView.addSubview(lineChart)
        self.lineChart.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -10).isActive = true
        self.lineChart.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 10).isActive = true
        self.lineChart.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20).isActive  = true
        self.lineChart.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20).isActive = true
        
    }
}

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "benefitsCell", for: indexPath) as! BenefitsTableViewCell
        
        cell.benefitsLabel.text = sample[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.corporateDarkBlue()
        
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
       return "TOP BENEFITS"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        var headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: headerView.bounds.height))
//        headerTitle.text = "Test"
//
//        headerView.backgroundColor = UIColor.corporateDarkBlue()
//
//        headerView.addSubview(headerTitle)
//
//        return headerView
//    }
    
    // CHECK TO SEE IF THERE IS INTERNER
    func isUserOnline() -> Bool {
        if isOnline{
            return true
        }
        return false
    }
    
    
}
