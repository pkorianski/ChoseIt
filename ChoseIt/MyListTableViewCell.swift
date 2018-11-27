//
//  MyListTableViewCell.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/18/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit

class MyListTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
