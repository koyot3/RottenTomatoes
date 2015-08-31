//
//  MovieCell.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit
import AFNetworking

class MovieCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var synopsys: UILabel!
    
    var item:NSDictionary!
    
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
            year.text = item.valueForKeyPath("year") as? String
            synopsys.text = item.valueForKeyPath("synopsis") as? String
            poster.setImageWithURL(NSURL(string:item.valueForKeyPath("posters.thumbnail") as! String)!)
        }
    }

}
