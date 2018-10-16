//
//  ViewController.swift
//  MVC
//
//  Created by SENTHIL on 15/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // Array of Person Model class
    var arrayOfList : [InfoModel] = []{
        // Reload data when data set
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   // Navigation Bar Hide
   self.navigationController?.navigationBar.isHidden = true
   readJsonFileFromSandbox()
        
    }
    
    //MARK: Read Json
    func readJsonFileFromSandbox(){
        
        if let filePath = Bundle.main.path(forResource: "Info", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            
            do {
                let decoder = JSONDecoder()
                self.arrayOfList = try decoder.decode([InfoModel].self, from: data as Data)
            }catch {
                //Handle error
            }
        }
    }

    //MARK:UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : InfoCell? = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as? InfoCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "InfoCell") as? InfoCell
        }
        
        let listObj = arrayOfList[indexPath.row]
        cell?.nameLabel.text = listObj.name
        cell?.CompanyLabel.text = listObj.company
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }

}
