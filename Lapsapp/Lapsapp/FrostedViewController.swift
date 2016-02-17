//
//  FrostedViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 17/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit
import Foundation
import REFrostedViewController

class FrostedViewController: REFrostedViewController {
    
    override func awakeFromNib() {
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BaseNavigationController")
        self.menuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SideMenuViewController")
    }
    
}