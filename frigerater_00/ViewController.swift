//
//  ViewController.swift
//  frigerater_00
//
//  Created by Zoey on 2016/11/23.
//  Copyright © 2016年 Zoey. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableViewData: UITableView!
    var dataArray :[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in:
            .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("ItemData.txt")
        if let array = NSArray(contentsOf: url!){
            dataArray = array as! [Dictionary<String, String>]
        }
        
        tableViewData.reloadData()
        
        
        print(docUrl)
        print(dataArray)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemInfo_ID", for: indexPath)
        
        var itemPhoto = cell.contentView.viewWithTag(24) as! UIImageView
        var nameLabel = cell.contentView.viewWithTag(20) as! UILabel
        var dateLabel = cell.contentView.viewWithTag(22) as! UILabel
        var numLabel = cell.contentView.viewWithTag(21) as! UILabel
        
        
       
       
        
        nameLabel.text = dataArray[indexPath.row]["name"]
        let lifeInfo = dataArray[indexPath.row]["date"]!
        
        dateLabel.text = "\(lifeInfo) days left"
        

        
        return cell
    }
    
}

