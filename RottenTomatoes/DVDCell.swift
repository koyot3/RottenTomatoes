//
//  DVDCell.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit

class DVDCell: UITableViewCell {

    @IBOutlet weak var poster: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var synponys: UILabel!
    
    var item:NSDictionary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}