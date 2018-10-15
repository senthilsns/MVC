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
                let json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                
               print(json)
            }
            catch {
                //Handle error
            }
        }
    }
    
    //MARK:UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : InfoCell? = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as? InfoCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "InfoCell") as? InfoCell
        }
        
        let model = InfoModel.init(name: "senthil", company: "Oottru")
        cell?.nameLabel.text = model.name
        cell?.CompanyLabel.text = model.company
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }

}
