//
//  DetailsController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 30/03/26.
//

import UIKit

class DetailsController: UIViewController {
    
    var info = ["": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
}
