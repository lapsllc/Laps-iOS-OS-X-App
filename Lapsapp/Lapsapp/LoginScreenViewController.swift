//
//  LoginScreenViewController.swift
//  Lapsapp
//
//  Created by Efe Helvaci on 16/02/16.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import VideoSplashKit

class LoginScreenViewController : VideoSplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = true
        self.startTime = 12.0
        self.duration = 4.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.blackColor()
        self.contentURL = url
        self.restartForeground = true
    }
}
