//
//  DetailViewController.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit
import AFNetworking
import JTProgressHUD

class DetailViewController: UIViewController {

    var item:NSDictionary!

    @IBOutlet weak var synopys: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var poster: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = item {
            name.text = item.valueForKeyPath("title") as! String
            synopys.text = item.valueForKeyPath("synopsis") as? String
            poster.setImageWithURL(NSURL(string:item.valueForKeyPath("posters.thumbnail") as! String)!)
        }
        JTProgressHUD.hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
