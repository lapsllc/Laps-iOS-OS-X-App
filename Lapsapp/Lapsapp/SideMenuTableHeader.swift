//
//  SideMenuTableHeader.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 18/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit

class SideMenuTableHeader: UIView {

    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var profileName: UILabel!

    override func awakeFromNib() {
        profilePic.layer.cornerRadius = 50.00
        profilePic.layer.borderColor = UIColor.whiteColor().CGColor
        profilePic.layer.borderWidth = 2.00
        profilePic.clipsToBounds = true
    }
}
