//
//  InfoCell.swift
//  MVC
//
//  Created by SENTHIL on 15/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var CompanyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
