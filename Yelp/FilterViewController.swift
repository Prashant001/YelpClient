//
//  FilterViewController.swift
//  Yelp
//
//  Created by Prashant Bhartiya on 9/22/14.
//  Copyright (c) 2014 Prashant Bhartiya. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate
{
    func searchTermChanged(selected: Bool)
   
}

class FilterViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var delegate:FilterViewControllerDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 40
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var filterCell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
        
        
        filterCell.selectionStyle = UITableViewCellSelectionStyle.None
        filterCell.delegate = delegate
        
        return filterCell
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
