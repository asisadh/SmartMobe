//
//  ListingViewTableCellView.swift
//  SmartMobe
//
//  Created by Aashish Adhikari on 4/10/19.
//  Copyright © 2019 Smart Mobe. All rights reserved.
//

import UIKit
import SDWebImage

class ListingViewTableCellView: UITableViewCell{
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(data: Image){
        
        if let id = data.id,
            let imageUrl = data.url{
            titleLabel.text = String(id)
            backgroundImage?.sd_setImage(with: URL(string: imageUrl),placeholderImage: UIImage(named: ""))
        }
    }
    
}
