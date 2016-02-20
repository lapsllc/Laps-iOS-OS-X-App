//
//  ProductViewController.swift
//  Laps iOS App
//
//  Created by Efe Helvaci on 20.02.2016.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet var productsCollectionView: UICollectionView!
    
    let screenSize = UIScreen.mainScreen().bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "ProductCollectionViewCell", bundle:nil)
        
        productsCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "ProductCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = productsCollectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCollectionViewCell
        
        cell.layer.cornerRadius = 3.00
        cell.layer.borderWidth = 1.00
        cell.layer.borderColor = UIColor.grayColor().CGColor
    
        cell.productName.text = "Chocolate Mocha"
        cell.productPrice.text = "$" + "10.95"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(screenSize.width, screenSize.height/3.00)
    }

}
