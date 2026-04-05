//
//  DetailsController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 30/03/26.
//

import UIKit

class DetailsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var id = 0
    
    var photos: [String] = []
    
    var info: [String: String] = [:]
        
    var items: [String] = []
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var photosCollection: UICollectionView!
    
    @IBOutlet weak var makeTitle: UILabel!
    
    @IBOutlet weak var modelTitle: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    
    @IBOutlet weak var mileageTitle: UILabel!
    
    @IBOutlet weak var colorTitle: UILabel!
    
    @IBOutlet weak var transmissionTitle: UILabel!
    
    @IBOutlet weak var newTitle: UILabel!
    
    @IBOutlet weak var viewsTitle: UILabel!
    
    @IBOutlet weak var viewsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let defaults = UserDefaults.standard
        
        let views = defaults.integer(forKey: "\(id)") + 1
                
        photo.layer.borderColor = UIColor.lightGray.cgColor
        
        photo.layer.borderWidth = 1
                
        photo.image = UIImage(named: photos[0])
        
        makeTitle.text = info["Make"]
        
        modelTitle.text = info["Model"]
        
        yearTitle.text = info["Year"]
        
        mileageTitle.text = info["Mileage"]
        
        colorTitle.text = info["Color"]
        
        transmissionTitle.text = info["Transmission"]
        
        newTitle.text = info["New"]
                
        viewsTitle.text = "\(views)"
        
        defaults.set(views, forKey: "\(id)")
        
        viewsButton.titleLabel?.textAlignment = .center
        
        viewsButton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            let buttonText: NSString = "Multi\nline"

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

        //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont(name: "Arial", size: 16.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

        let font2: UIFont = UIFont(name: "Arial", size: 16.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

        //appending both attributed strings
        attrString1.append(attrString2)

        //assigning the resultant attributed strings to the button
        viewsButton?.setAttributedTitle(attrString1, for: [])
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PhotosCollection
        
        // Source - https://stackoverflow.com/a/52838284
        // Posted by Sathish Kumar Gurunathan
        // Retrieved 2026-04-03, License - CC BY-SA 4.0

        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: flowLayout.itemSize.width, height: flowLayout.itemSize.height)
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.photo.image = UIImage(named: self.items[indexPath.row]) // The row value is the same as the index of the desired text within the array.
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itm = indexPath.item
        
        // handle tap events
        print("You selected cell #\(itm)!")
        
        photo.image = UIImage(named: photos[itm])
        
        let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.blue.cgColor
            cell?.isSelected = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.isSelected = false
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
}
