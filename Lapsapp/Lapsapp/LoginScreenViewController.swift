//
//  LoginScreenViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 16/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import VideoSplashKit
import FBSDKLoginKit
import FBSDKCoreKit
import LapsKit

class LoginScreenViewController : VideoSplashViewController, AuthenticationSessionDelegate {
    
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var facebookLoginButton: UIButton!
    
    var swipeLeft : UISwipeGestureRecognizer?
    var swipeRight : UISwipeGestureRecognizer?
    var swipeDown : UISwipeGestureRecognizer?
    var swipeUp : UISwipeGestureRecognizer?
    var tap : UITapGestureRecognizer?
    
    var authenticationSession : AuthenticationSession?
    
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
        
        facebookLoginButton.alpha = 0.00
        
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
        
        authenticationSession = AuthenticationSession(delegate: self)
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
                        self.facebookLoginButton.alpha = 1.00
                        self.alpha = 0.70
                        }, completion: nil)
                }
        })
        
    }
    
    func tapped() {
        NSLog("TAPPED BRUH")
    }
    
    @IBAction func closeButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func facebookLoginButtonClicked(sender: AnyObject)
    {
//        var fbAccessToken = FBSDKAccessToken.currentAccessToken().tokenString
        
        let loginManager : FBSDKLoginManager = FBSDKLoginManager.init()
        
        let facebookReadPermissions = ["public_profile", "email", "user_friends"]
        
        loginManager.logInWithReadPermissions(facebookReadPermissions, fromViewController: self) { (result, error) -> Void in
            if (error != nil)
            {
                debugPrint(error)
                debugPrint("Facebook login sucks")
            }
            else if result.isCancelled
            {
                debugPrint("Facebook login cancelled")
            }
            else
            {
                debugPrint("Facebook login successful")
                debugPrint(result.token)
                self.authenticationSession!.challenge(result.token.tokenString)
                
            }
        }
        
        
    }
    
     func didFinishAuthenticating(user: User?, error: NSError?) {
        debugPrint(error)
        debugPrint(user?.name)
    }
}
