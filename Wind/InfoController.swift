//
//  InfoController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 25/03/26.
//

import UIKit

class InfoController: UIViewController {
    
    @IBOutlet weak var appVersionTitle: UILabel!
    
    @IBOutlet weak var buildVersionTitle: UILabel!
    
    @IBOutlet weak var copyright: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        appVersionTitle.text = "App version: \(appVersion!)"
        
        let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

        buildVersionTitle.text = "Build version: \(buildVersion!)"

        let year = Calendar.current.component(.year, from: Date())
        
        copyright.text = "Copyright \(year)"

    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
}
