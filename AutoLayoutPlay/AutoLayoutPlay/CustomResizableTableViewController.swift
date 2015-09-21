//
//  CustomResizableTableViewController.swift
//  ResizableList
//
//  Created by Vinayak Srivastava on 21/09/15.
//  Copyright (c) 2015 Vinayak Srivastava. All rights reserved.
//

import UIKit

class CustomResizableTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var data = [Int:String]()
    
    private func initData() {
        data[0] = "This tutorial also assumes you have a basic familiarity with auto layout, UITableView and Swift development"
        data[1] = "While it inspired hope for countless developers, auto layout was still cumbersome. Manually writing auto layout code was, and still is, a great example of the verbosity of iOS development. Interface Builder as well was initially quite counterproductive when you set up constraints."
        data[2] = "Flash forward to now. With all the improvements to Interface Builder and the introduction of iOS 8, it’s finally easy to use auto layout to create dynamic table view cells!"
    }
    
    private var selectedIndexPath: NSIndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.reloadData()
    }
    
    private struct Storyboard {
        static let CustomCellIdentifier = "CustomResizableCell"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CustomCellIdentifier, forIndexPath: indexPath) as! CustomResizableCell
        //cell.description3Label.text = data[indexPath.row]
        return cell
    }
   
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
