//
//  RefrigeratViewController.swift
//  frigerater_00
//
//  Created by Zoey on 2016/11/27.
//  Copyright © 2016年 Zoey. All rights reserved.
//

import UIKit

class RefrigeratViewController: UIViewController,UITableViewDataSource {

    var itemData = ["Name":"steak","Num":2,"Life":"3 days left"] as [String : Any]
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemInfo_ID",for: indexPath)
        let name = itemData["Name"]
        cell.textLabel?.text = name as! String?
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
   
 }
