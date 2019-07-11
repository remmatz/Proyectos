//
//  collectionTableViewCell.swift
//  collectionenCelda
//
//  Created by Adrian Pascual Dominguez Gomez on 7/10/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit

class collectionTableViewCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate{

      @IBOutlet weak var tableview: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Debe ser collection
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .gray
        tableview.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}


extension collectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
}
