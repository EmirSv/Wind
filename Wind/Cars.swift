//
//  Cars.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 23/03/26.
//

import UIKit

class Cars: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let cars: [String] = ["car-1", "car-2", "car-3", "car-4", "car-5"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:Car = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as! Car
        
        // set the text from the data model
        cell.photo?.image = UIImage(named: self.cars[indexPath.row])
        
        cell.photo.layer.cornerRadius = 15
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Identify which segue is happening
        if segue.identifier == "showDetailsSegue" {
            
            // 2. Get a reference to the destination view controller
            if let destinationVC = segue.destination as? DetailsController {
                
                // 3. Pass the data
                destinationVC.info = ["Make": "BMW", "Model": "X7", "Year": "2026", "Mileage": "10", "Color": "Red", "Transmission": "Automatic", "New": "Yes"]
            }
        }
    }

}
