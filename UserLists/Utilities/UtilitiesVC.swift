//
//  UtilitiesVC.swift
//  UserLists
//
//  Created by Dhanya Shaju  on 28/04/21.
//  Copyright © 2021 Dhanya Shaju . All rights reserved.
//

import UIKit

class UtilitiesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}

class ActivityIndicator
{
    var activityView:UIActivityIndicatorView!
    var view = UIView(frame: UIScreen.main.bounds)

    func start()
    {
        DispatchQueue.main.async {

            if self.activityView == nil
            {
                self.activityView = UIActivityIndicatorView(style: .whiteLarge)
                self.activityView.frame = CGRect(x: (self.view.bounds.maxX/2)-20,
                                            y: (self.view.bounds.maxY/2)-20,
                                            width: 40, height: 40)
                self.view.addSubview(self.activityView)
                self.view.backgroundColor = UIColor(red:170/255, green:170/255, blue:170/255, alpha:0.8)
                UIApplication.shared.keyWindow?.addSubview(self.view)
                self.activityView.startAnimating()
            }
            else if self.activityView.isAnimating == true
            {
                //activityView.stopAnimating()
            }
            else
            {
                UIApplication.shared.keyWindow?.addSubview(self.view)
                self.activityView.startAnimating()
            }

        }
        //F96F02
    }

    func stop()
    {
        DispatchQueue.main.async {
            if self.activityView == nil || self.activityView.isAnimating == false
            {
            }
            else
            {
                self.activityView.stopAnimating()
                self.view.removeFromSuperview()
            }

        }
    }
}
extension UITextField {
    
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.2)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
