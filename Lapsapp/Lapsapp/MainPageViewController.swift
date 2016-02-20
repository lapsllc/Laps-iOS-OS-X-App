//
//  MainPageViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 17/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit
import REFrostedViewController

class MainPageViewController : UIViewController, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var brandCollectionView: UICollectionView!
    
    let screenSize = UIScreen.mainScreen().bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "BrandsCollectionViewCell", bundle:nil)
        
        brandCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "BrandCell")
        
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
        logoImageView.frame.size = CGSize(width: 20, height: 40)
        logoImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.navigationItem.titleView = logoImageView
        
        performSegueWithIdentifier("MainPageToLoginScreen", sender: nil)
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

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = brandCollectionView.dequeueReusableCellWithReuseIdentifier("BrandCell", forIndexPath: indexPath) as! BrandsCollectionViewCell
        
        cell.layer.cornerRadius = 0.00
        
        cell.brandName.text = "  " + "Starbucks Coffee"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("MainPageToProductPage", sender: nil)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSizeMake(screenSize.width, screenSize.width*(1236.00/2048.00))
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.destinationViewController.isKindOfClass(ProductViewController))
        {
//            let vc : ProductViewController = segue.destinationViewController
//            TODO / send brand
        }
    }
    
    @IBAction func profileButtonClicked(sender: AnyObject) {
        self.frostedViewController.panGestureEnabled = true
        self.frostedViewController.direction = REFrostedViewControllerDirection.Left
        self.frostedViewController.menuViewSize = CGSizeMake(screenSize.width*0.7, screenSize.height)
        
        self.frostedViewController.presentMenuViewController()
    }
    
    @IBAction func loginButtonClicked(sender: AnyObject) {
        performSegueWithIdentifier("MainPageToLoginScreen", sender: nil)
    }
}

