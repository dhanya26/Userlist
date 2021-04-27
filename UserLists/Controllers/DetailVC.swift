//
//  DetailVC.swift
//  UserLists
//
//  Created by Dhanya Shaju  on 27/04/21.
//  Copyright © 2021 Dhanya Shaju . All rights reserved.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    var firname = ""
    var lastNamee = ""
    var email = ""
    var imurl = ""
    var id = 0
    
    var delegate:EditedValues?
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var lastNmaetext: UITextField!
    
    
    
    
    
    @IBAction func saveActn(_ sender: Any) {
        guard let navigationVC = self.navigationController else { return }
           navigationVC.popViewController(animated: false)
        delegate?.editedName(first: firstName.text ?? "", last: lastNmaetext.text ?? "", id: self.id)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstName.text = self.firname
        lastNmaetext.text = self.lastNamee
        emailLbl.text = self.email
        imgView.kf.setImage(with: URL(string: imurl))
        imgView.layer.cornerRadius = imgView.bounds.height/2
        firstName.setUnderLine()
        lastNmaetext.setUnderLine()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol EditedValues: class {
    func editedName(first:String,last:String,id:Int)
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
