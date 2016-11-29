//
//  AddMoreItemViewController.swift
//  frigerater_00
//
//  Created by Zoey on 2016/11/27.
//  Copyright © 2016年 Zoey. All rights reserved.
//

import UIKit

class AddMoreItemViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var tagImage: UIImageView!
    @IBOutlet weak var ItemCate: UILabel!
    @IBOutlet weak var itemToStay: UISegmentedControl!
    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var showTheItem: UIImageView!
    
    
    var dateValue:Int = 1
    
    @IBAction func datePicker(_ sender: UISlider) {
        
        dateValue = Int(sender.value)
        showDate.text = "\(dateValue)"
    }
    
    
    //相機
    private func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        let image = info[UIImagePickerControllerOriginalImage]
        
        self.showTheItem.image = image as? UIImage
        
        UIImageWriteToSavedPhotosAlbum(self.showTheItem.image!, nil, nil, nil)
        
        self.dismiss(animated:true, completion: nil)
    }

    //照相
    @IBAction func takePhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    var dataArray :[Dictionary<String,String>] = []
    
    //儲存紀錄位址的DataArray
    func saveFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in:
            .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("ItemData.txt")
        let array = dataArray
        (array as NSArray).write(to: url!, atomically: true)
    }
    
    //讀取紀錄位址的DataArray
    func loadFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in:
            .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("ItemData.txt")
        if let array = NSArray(contentsOf: url!){
            dataArray = array as! [Dictionary<String, String>]
            
        }}
    
    
    @IBAction func comfirmBtn(_ sender: Any) {
        
        var itemData = ["name":itemNameTF.text,"date":showDate.text]
        
        dataArray.append(itemData as! [String : String])
        
        saveFile()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        loadFile()
        
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
