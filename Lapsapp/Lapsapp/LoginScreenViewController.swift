//
//  LoginScreenViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 16/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import VideoSplashKit

class LoginScreenViewController : VideoSplashViewController {
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!
    
    var swipeLeft : UISwipeGestureRecognizer?
    var swipeRight : UISwipeGestureRecognizer?
    var swipeDown : UISwipeGestureRecognizer?
    var swipeUp : UISwipeGestureRecognizer?
    var tap : UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = false
        self.startTime = 12.0
        self.duration = 6.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.blackColor()
        self.contentURL = url
        self.restartForeground = true
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("swiped"))
        swipeLeft!.direction = UISwipeGestureRecognizerDirection.Left
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("swiped"))
        swipeRight!.direction = UISwipeGestureRecognizerDirection.Right
        
        swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("swiped"))
        swipeDown!.direction = UISwipeGestureRecognizerDirection.Down
        
        swipeUp = UISwipeGestureRecognizer(target: self, action: Selector("swiped"))
        swipeUp!.direction = UISwipeGestureRecognizerDirection.Up
        
        tap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        
        view.addGestureRecognizer(swipeLeft!)
        view.addGestureRecognizer(swipeRight!)
        view.addGestureRecognizer(swipeDown!)
        view.addGestureRecognizer(swipeUp!)
        view.addGestureRecognizer(tap!)
    }
    
    func swiped() {
        NSLog("SWIPED BRUH")
        UIView.animateWithDuration(1.00, delay:0.00, options: [.CurveEaseOut], animations: {
            self.alpha = 0.00
            self.logoImageView.alpha = 0.00
            self.welcomeLabel.alpha = 0.00
            }, completion: { finished in
                if(finished){
                    self.logoImageView.removeFromSuperview()
                    self.welcomeLabel.removeFromSuperview()
                    
                    self.view.removeGestureRecognizer(self.swipeLeft!)
                    self.view.removeGestureRecognizer(self.swipeRight!)
                    self.view.removeGestureRecognizer(self.swipeDown!)
                    self.view.removeGestureRecognizer(self.swipeUp!)
                    self.view.removeGestureRecognizer(self.tap!)
                    
//                    self.contentURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test2", ofType: "mp4")!)
                    
                    UIView.animateWithDuration(1.00, delay:0.00, options: [.CurveEaseIn], animations: {
                        self.alpha = 0.70
                        }, completion: nil)
                }
        })
        
    }
    
    func tapped() {
        NSLog("TAPPED BRUH")
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
