//
//  DetailsController.swift
//  Wind
//
//  Created by Emir Seitdjelilov on 30/03/26.
//

import UIKit

class DetailsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var photosCollection: UICollectionView!
    
    @IBOutlet weak var makeTitle: UILabel!
    
    @IBOutlet weak var modelTitle: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    
    @IBOutlet weak var mileageTitle: UILabel!
    
    @IBOutlet weak var colorTitle: UILabel!
    
    @IBOutlet weak var transmissionTitle: UILabel!
    
    @IBOutlet weak var newTitle: UILabel!
    
    var info = ["": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.image = UIImage(named: "photo-1")
        
        makeTitle.text = "Ferrari"
        
        modelTitle.text = "Purousange"
        
        yearTitle.text = "2026"
        
        mileageTitle.text = "10"
        
        colorTitle.text = "Red"
        
        transmissionTitle.text = "Automatic"
        
        newTitle.text = "Yes"
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard

    var items = ["small-photo-1", "small-photo-2", "small-photo-3", "small-photo-1", "small-photo-2", "small-photo-3"]
    
    
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
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.photo.image = UIImage(named: self.items[indexPath.row]) // The row value is the same as the index of the desired text within the array.
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
}
