//
//  ViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
        FilterViewControllerDelegate{
    var client: YelpClient!
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    var categoryFilter: [String] = []
    
    
    
    var items : [NSDictionary] = []
 
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
          tableView.delegate = self
          tableView.dataSource = self
         // tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
             self.items = response["businesses"] as [NSDictionary]
            // Do any additional setup after loading the view.
            self.tableView.reloadData()
        }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            println(error)
        }
        
        
       /* client.search(self.searchItem, categories: self.categoryFilter, dealsFilter: self.dealsFilter, radiusFilter: self.radiusFilter, sortByFilter: self.sortByFilter, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            self.items = response["businesses"] as [NSDictionary]
            
            // Do any additional setup after loading the view.
            self.tableView.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }*/

    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
       return  items.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as UserCell
         cell.listing = items[indexPath.row]
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        let filterNavigationController = segue.destinationViewController as UINavigationController
        
       
        var filterViewController = filterNavigationController.viewControllers[0] as FilterViewController
        
        
        filterViewController.delegate = self
    }
    func searchTermChanged(selected: Bool) {
        
    }

    
    
    
}

