//
//  DVDCell.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit
import AFNetworking

class DVDCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var synponys: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initWithData(data: NSDictionary!){
        if let item = data {
            title.text = item.valueForKeyPath("title") as? String
            year.text = (String) (item.valueForKeyPath("year") as! Int)
            synponys.text = item.valueForKeyPath("synopsis") as? String
            poster.setImageWithURL(NSURL(string:item.valueForKeyPath("posters.thumbnail") as! String)!)
        }
    }

}
