//
//  ProductCollectionViewCell.swift
//  Laps iOS App
//
//  Created by Efe Helvaci on 20.02.2016.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var brandLogo: UIImageView!
    
    @IBOutlet var productName: UILabel!
    
    @IBOutlet var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
