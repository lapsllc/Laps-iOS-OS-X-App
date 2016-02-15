//
//  ViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 15/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit
import Alamofire

enum Route {
    case North
    case South
    case East
    case West
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        startApplication(.North)
    }
    
    func startApplication(route: Route) {
        if let url = NSURL(string: "http://www.example.com") {
            debugPrint(url.absoluteString)
        }
    }
}

