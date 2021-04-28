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
    
    //Variables
    
    var firname = ""
    var lastNamee = ""
    var email = ""
    var imurl = ""
    var id = 0
    var renameHandler: ((_ name: String,_ lastname: String, _ id: Int) -> Void)?
    
    //IBOutlets
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var lastNmaetext: UITextField!
    
    
    //IBActions
    
    @IBAction func saveActn(_ sender: Any) {
        
        
        guard let navigationVC = self.navigationController else { return }
        navigationVC.popViewController(animated: false)
        
        if let handler = renameHandler {
            handler(firstName.text ?? "", lastNmaetext.text ?? "", self.id)
        }
        
    }
    
    //VCOverides
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
    
    //Closure
    
    func handleRenaming(handler: @escaping (_ name: String,_ lastname: String, _ id: Int) -> Void) {
           renameHandler = handler
       }
    
}




