//
//  DetailsController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 30/03/26.
//

import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    
    var info = ["": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.image = UIImage(named: "photo-1")
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
}
