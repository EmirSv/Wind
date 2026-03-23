//
//  Contact.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 21/03/26.
//

import UIKit
import MapKit

class ContactController: UIViewController {
    
    @IBOutlet weak var standardButton: UIButton!
    
    @IBOutlet weak var SatelliteButton: UIButton!
    
    @IBOutlet weak var hybridButton: UIButton!
    
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
    
    @IBAction func mapTypePressed(_ sender: UIButton) {
        
        standardButton.backgroundColor = UIColor.white
                
        SatelliteButton.backgroundColor = UIColor.white
        
        hybridButton.backgroundColor = UIColor.white
        
        sender.backgroundColor = UIColor.gray
        
        switch sender.tag {
            
            case 0:
                
                clientMap.preferredConfiguration = MKStandardMapConfiguration()
                
            case 1:
                
                clientMap.preferredConfiguration = MKImageryMapConfiguration()
                
            case 2:
                
                clientMap.preferredConfiguration = MKHybridMapConfiguration()
                
            default:
                
                break
        }
    }
}
