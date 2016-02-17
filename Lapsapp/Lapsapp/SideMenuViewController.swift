//
//  SideMenuViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 17/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit
import Foundation

class SideMenuViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "SideMenuViewCell", bundle:nil)
        
        profileTableView.registerNib(nibName, forCellReuseIdentifier: "sideMenuItem")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let view = UIView(frame: CGRectMake(0, 0, 0, 184.0))
        let imageView = UIImageView(frame: CGRectMake(0, 40, 100, 100))
        imageView.image = UIImage(named: "TestProfilePic")
        imageView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleLeftMargin.rawValue | UIViewAutoresizing.FlexibleRightMargin.rawValue)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50.00
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 3.00
        imageView.layer.rasterizationScale = UIScreen.mainScreen().scale
        imageView.layer.shouldRasterize = true
        imageView.clipsToBounds = true
        
        let label = UILabel(frame: CGRectMake(0, 150, 0, 24))
        label.text = "Efe Helvacı"
        label.font = UIFont(name: "HelveticaNeue", size: 21)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.blackColor()
        label.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleLeftMargin.rawValue | UIViewAutoresizing.FlexibleRightMargin.rawValue)
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        profileTableView.tableHeaderView = view
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCellWithIdentifier("sideMenuItem") as! SideMenuViewCell
        
        cell.menuItemLabel.text = "Lolanza"
        cell.layer.backgroundColor = UIColor.clearColor().CGColor
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}