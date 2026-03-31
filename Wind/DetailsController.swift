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
    
    var info = ["": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.image = UIImage(named: "photo-1")
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard

    var items = ["photo-1", "photo-2", "photo-3", "photo-1", "photo-2", "photo-3"]
    
    
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
