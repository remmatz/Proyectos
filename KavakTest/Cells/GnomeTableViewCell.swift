//
//  GnomeTableViewCell.swift
//  KavakTest
//
//  Created by Adrian Pascual Dominguez Gomez on 7/8/19.
//  Copyright © 2019 Adrian Pascual Dominguez Gomez. All rights reserved.
//

import UIKit

class GnomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profilePicture?.layer.cornerRadius = profilePicture.frame.width/2
        profilePicture?.clipsToBounds = true
        profilePicture?.contentMode = .scaleAspectFit
        profilePicture?.backgroundColor = UIColor.lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profilePicture?.image = nil
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
    
}
