//
//  MainPageViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 17/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit
import Foundation
import REFrostedViewController

class MainPageViewController : UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var brandCollectionView: UICollectionView!
    
    let screenSize = UIScreen.mainScreen().bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "BrandsCollectionViewCell", bundle:nil)
        
        brandCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "BrandCell")
        
        self.navigationItem.title = "laps!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
         performSegueWithIdentifier("MainPageToLoginScreen", sender: nil)

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = brandCollectionView.dequeueReusableCellWithReuseIdentifier("BrandCell", forIndexPath: indexPath) as! BrandsCollectionViewCell
        
        cell.layer.cornerRadius = 5.00
        
        cell.brandName.text = "Starbucks"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSizeMake(screenSize.width-10, screenSize.height/3.0)
    }
    
    @IBAction func profileButtonClicked(sender: AnyObject) {
        self.frostedViewController.panGestureEnabled = true
        self.frostedViewController.direction = REFrostedViewControllerDirection.Left
        self.frostedViewController.menuViewSize = CGSizeMake(screenSize.width*0.7, screenSize.height)
        
        self.frostedViewController.presentMenuViewController()
    }
    
}

