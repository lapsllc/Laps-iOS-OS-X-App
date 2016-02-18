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
    
    let sidebarElements : [String] = ["Profile", "My Cart", "Wishlist", "Favorites", "History"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "SideMenuViewCell", bundle:nil)
        
        profileTableView.registerNib(nibName, forCellReuseIdentifier: "sideMenuItem")
        
        let viewArray = NSBundle.mainBundle().loadNibNamed("SideMenuTableHeader", owner: self, options: nil)
        let view = viewArray[0] as! UIView
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 150.00)
        
        profileTableView.tableHeaderView = view
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

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCellWithIdentifier("sideMenuItem") as! SideMenuViewCell
        
        cell.menuItemLabel.text = sidebarElements[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sidebarElements.count
    }
}