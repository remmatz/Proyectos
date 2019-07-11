//
//  CollectionViewCell.swift
//  collectionenCelda
//
//  Created by Adrian Pascual Dominguez Gomez on 7/10/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
