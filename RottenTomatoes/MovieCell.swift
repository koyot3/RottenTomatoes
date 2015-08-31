//
//  MovieCell.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit
import AFNetworking
import RateView

class MovieCell: UITableViewCell, RateViewDelegate {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var synopsys: UILabel!
    
    @IBOutlet weak var rateView: RateView!
    
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
            year.text = (String) (item.valueForKeyPath("year") as! Int)
            synopsys.text = item.valueForKeyPath("synopsis") as? String
            poster.setImageWithURL(NSURL(string:item.valueForKeyPath("posters.thumbnail") as! String)!)
        }        
        rateView = RateView(rating: 3.7)
    }
    

    func rateView(rateView: RateView!, didUpdateRating rating: Float) {
        
    }

}
