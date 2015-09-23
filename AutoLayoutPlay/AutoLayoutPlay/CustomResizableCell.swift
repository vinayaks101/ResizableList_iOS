//
//  CustomResizableCell.swift
//  ResizableList
//
//  Created by Vinayak Srivastava on 21/09/15.
//  Copyright (c) 2015 Vinayak Srivastava. All rights reserved.
//

import UIKit

class CustomResizableCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var companyHeightContraint: NSLayoutConstraint!
    
    func hideCompanyDetails() {
        companyNameLabel.hidden = true
        companyHeightContraint.constant = 0.0
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.companyNameLabel.setNeedsDisplay()
            }, completion: nil)
    }
    
    func showCompanyDetails() {
        companyNameLabel.hidden = false
        companyHeightContraint.constant = 21.0
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.companyNameLabel.setNeedsDisplay()
            }, completion: nil)
    }
    
}
