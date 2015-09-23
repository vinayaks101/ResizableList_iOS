//
//  CustomResizableTableViewController.swift
//  ResizableList
//
//  Created by Vinayak Srivastava on 21/09/15.
//  Copyright (c) 2015 Vinayak Srivastava. All rights reserved.
//

import UIKit

class CustomResizableTableViewController: UITableViewController {
    
    private var data = [Int:String]()
    
    private func initData() {
        data[0] = "This tutorial also assumes you have a basic familiarity with auto layout, UITableView and Swift development"
        data[1] = "While it inspired hope for countless developers, auto layout was still cumbersome. Manually writing auto layout code was, and still is, a great example of the verbosity of iOS development. Interface Builder as well was initially quite counterproductive when you set up constraints."
        data[2] = "Flash forward to now. With all the improvements to Interface Builder and the introduction of iOS 8, it’s finally easy to use auto layout to create dynamic table view cells!"
    }
    
    private var prevSelectedIndexPath: NSIndexPath? = nil
    private var selectedIndexPath: NSIndexPath? {
        willSet {
            prevSelectedIndexPath = selectedIndexPath
        }
    }
    private var indexPathsToUpdate = [NSIndexPath] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.estimatedRowHeight = CGFloat(100)
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.reloadData()
    }
    
    private struct Storyboard {
        static let CustomCellIdentifier = "CustomResizableCell"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CustomCellIdentifier, forIndexPath: indexPath) as! CustomResizableCell
        cell.descriptionLabel.text = data[indexPath.row]
        
        if selectedIndexPath == indexPath {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexPathsToUpdate.removeAll(keepCapacity: false)
        
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
            indexPathsToUpdate.append(indexPath)
        }
        
        if prevSelectedIndexPath != nil {
            indexPathsToUpdate.append(prevSelectedIndexPath!)
        }
        
        tableView.reloadRowsAtIndexPaths(indexPathsToUpdate, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
   
}
