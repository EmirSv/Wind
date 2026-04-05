//
//  Cars.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 23/03/26.
//

import UIKit

class Cars: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let ids = [1, 2, 3, 4, 5]
    
    // Data model: These strings will be the data for the table view cells
    let cars: [String] = ["car-1", "car-2", "car-3", "car-4", "car-5"]
    
    let photos = [
        ["photo-1", "photo-2", "photo-3"],
        ["photo-4", "photo-5", "photo-6"],
        ["photo-7", "photo-8", "photo-9"],
        ["photo-10", "photo-11"],
        ["photo-12", "photo-13", "photo-14"]
    ]
    
    let carsInfo = [
        ["Make": "BMW", "Model": "X7", "Year": "2026", "Mileage": "10", "Color": "Red", "Transmission": "Manual", "New": "Yes"],
        ["Make": "Ferrari", "Model": "Purousage", "Year": "2026", "Mileage": "25", "Color": "White", "Transmission": "Automatic", "New": "Yes"],
        ["Make": "Chevrolet", "Model": "Trailblazer", "Year": "2025", "Mileage": "1200", "Color": "Blue", "Transmission": "Manual", "New": "No"],
        ["Make": "Mercedes", "Model": "IQ7", "Year": "2026", "Mileage": "10", "Color": "Red", "Transmission": "Automatic", "New": "Yes"],
        ["Make": "Toyota", "Model": "Yaris", "Year": "2024", "Mileage": "3400", "Color": "Black", "Transmission": "Automatic", "New": "No"]
    ]
    
    let items = [
        ["small-photo-1", "small-photo-2", "small-photo-3"],
        ["small-photo-4", "small-photo-5", "small-photo-6"],
        ["small-photo-7", "small-photo-8", "small-photo-9"],
        ["small-photo-10", "small-photo-11"],
        ["small-photo-12", "small-photo-13", "small-photo-14"]
    ]
    
    var row: Int = 0
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!

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
        
        row = indexPath.row
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Identify which segue is happening
        if segue.identifier == "showDetailsSegue" {
            
            // 2. Get a reference to the destination view controller
            if let destinationVC = segue.destination as? DetailsController {
                
                // 3. Pass the data
                destinationVC.id = ids[row]
                
                destinationVC.photos = photos[row]
                
                destinationVC.items = items[row]
                
                destinationVC.info = carsInfo[row]
            }
        }
    }

}
