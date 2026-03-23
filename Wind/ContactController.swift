//
//  Contact.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 21/03/26.
//

import UIKit
import MapKit

class ContactController: UIViewController {
    
    @IBOutlet weak var clientMap: MKMapView!
    
    @IBOutlet weak var clockLabel: UILabel!
    
    @IBAction func backPressed(_ sender: UIButton) {
 
        self.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if clockLabel.applyGradientWith(startColor: .gray, endColor: .green) {
            
            print("Gradient applied!")
            
        } else {
        
            print("Could not apply gradient")
            
            clockLabel.textColor = .black
        }
    }
}
