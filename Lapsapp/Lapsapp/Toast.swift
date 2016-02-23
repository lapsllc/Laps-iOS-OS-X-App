//
//  Toast.swift
//  Laps iOS App
//
//  Created by Efe Helvaci on 23.02.2016.
//  Copyright © 2016 Laps LLC. All rights reserved.
//

import UIKit

public class Toast: UIView {
    
    let screenSize = UIScreen.mainScreen().bounds.size
    var label : UILabel?
    
    public func showToast(inView : UIView, text : String, duration : Double)
    {
        let parentFrame = inView.frame
        
        let selfFrame = CGRectMake(parentFrame.origin.x+((parentFrame.size.width/2.0)-parentFrame.size.width*(3.00/10)), parentFrame.size.height-70.00, parentFrame.size.width*(3.00/5), 30.00)
        
        let toast = Toast(frame: selfFrame)
        
        toast.backgroundColor = UIColor.lightGrayColor()
        toast.alpha = 0.00
        toast.layer.cornerRadius = 4.00
        toast.label!.text = text
        
        inView.addSubview(toast)
        
        UIView.animateWithDuration(0.75, animations: {
            toast.alpha = 0.90
            toast.label!.alpha = 1.00
        })
        
        toast.performSelector(Selector("hideSelf"), withObject: nil, afterDelay: duration)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.label = UILabel(frame: CGRectMake(5, 5, frame.size.width-10, frame.size.height-5))
        self.label!.backgroundColor = UIColor.clearColor()
        self.label!.textAlignment = .Center
        self.label!.textColor = UIColor.whiteColor()
        self.label!.numberOfLines = 1
        self.label!.font = UIFont.systemFontOfSize(15)
        
        self.addSubview(self.label!)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideSelf(){
        UIView.animateWithDuration(0.40, animations: {
                self.alpha = 0.00
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
}