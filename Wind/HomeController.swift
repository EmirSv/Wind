//
//  ViewController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 19/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    var i = 0
    
    @IBOutlet weak var bg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func mePressed(_ sender: UIButton) {
        
        if(i == 0) {
            
            bg.image = UIImage(named: "1")
            
            titleLabel.text = "Welcome"
            
            i = 1
            
        } else if(i == 1) {
            
            bg.image = UIImage(named: "2")
            
            titleLabel.text = "Done"
            
            i = 0
        }
    }
}

