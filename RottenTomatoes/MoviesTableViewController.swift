//
//  MoviesTableViewController.swift
//  RottenTomatoes
//
//  Created by admin on 8/31/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit
import AFNetworking
import JTProgressHUD

class MoviesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    var movies:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let url = NSURL(string: GlobalConfig.BOX_OFFICE_API)
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if (data != nil){
            
            if let dict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:nil) as? NSDictionary {
                self.movies = dict["movies"] as! NSArray
                self.tableView.reloadData()
            } else {
                self.searchBar.text = "No network"
            }
            } else {
                self.searchBar.text = "No network"
            }
        })
        
        var refreshControl: UIRefreshControl! = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.insertSubview(refreshControl, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result:Int
        if let items = movies {
            result = items.count
        } else {
            result = 0
        }
        return result
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.initWithData(self.movies[indexPath.row] as! NSDictionary)
        return cell
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        JTProgressHUD.show()
        let movie = movies![indexPath.row] as! NSDictionary
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.item = movie
        JTProgressHUD.show()
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh(refresh:UIRefreshControl) {
        delay(2, closure: {
            self.tableView.reloadData()
            refresh.endRefreshing()
        })
    }

}
