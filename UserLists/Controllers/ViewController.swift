//
//  ViewController.swift
//  UserLists
//
//  Created by Dhanya Shaju  on 27/04/21.
//  Copyright © 2021 Dhanya Shaju . All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
 //Variables
    
    var userdatas:UserModel?
    var selid = 0
    
//IBOutlets
    
    @IBOutlet weak var listTable: UITableView!
    
    
//VCOverides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.getData()
        listTable.tableFooterView = UIView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
    
    }
    
    //TableviewDelegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userdatas?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        
        cell.emailLbl.text = self.userdatas?.data?[indexPath.row].email
        cell.nameLbl.text = (self.userdatas?.data?[indexPath.row].first_name ?? "") + " " + (self.userdatas?.data?[indexPath.row].last_name ?? "")
        cell.bgView.layer.cornerRadius = cell.bgView.frame.size.width / 2
        cell.profImg.layer.cornerRadius = cell.profImg.frame.size.width / 2
        
        if indexPath.row % 2 == 0 {
            
            cell.letterName.text = "\((self.userdatas?.data?[indexPath.row].first_name?.prefix(1) ?? "")  + (self.userdatas?.data?[indexPath.row].last_name?.prefix(1) ?? ""))"
            
        } else {
            
            cell.profImg.kf.setImage(with: URL(string: self.userdatas?.data?[indexPath.row].avatar ?? ""))
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.selid = indexPath.row
        self.performSegue(withIdentifier: "detail", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.userdatas?.data?.remove(at: indexPath.row)
            self.listTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    //ParametersPassing-Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail") {
            let nextVC = segue.destination as! DetailVC
          
            nextVC.firname = self.userdatas?.data?[self.selid].first_name ?? ""
            nextVC.lastNamee = self.userdatas?.data?[self.selid].last_name ?? ""
            nextVC.email = self.userdatas?.data?[self.selid].email ?? ""
            nextVC.imurl = self.userdatas?.data?[self.selid].avatar ?? ""
            nextVC.id = self.selid
            
            
            nextVC.handleRenaming(handler: { (listName,lastname,id) in
               
                self.userdatas?.data?[id].first_name = listName
                self.userdatas?.data?[id].last_name = lastname
                self.listTable.reloadData()
                
            }
            )
            
        }
        
    }
    
    
    //APICall
    
    func getData(){
        
        let url = "https://reqres.in/api/users?"
        
        let activity = ActivityIndicator()
        activity.start()
        
        Alamofire.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserModel>) in
                switch response.result {
                case .success(_):
                    self.userdatas = response.result.value
                    DispatchQueue.main.async {
                        self.listTable.reloadData()
                        
                    }
                    
                    activity.stop()
                    
                    
                case .failure(_):
                    print("h")
                    activity.stop()
                    
                }
        }
        
        
        
    }
    
    
}


class UserCell:UITableViewCell{
    
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var letterName: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
}


