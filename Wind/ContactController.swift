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
    
    @IBAction func backPressed(_ sender: UIButton) {
 
        self.dismiss(animated: false)
    }
}
