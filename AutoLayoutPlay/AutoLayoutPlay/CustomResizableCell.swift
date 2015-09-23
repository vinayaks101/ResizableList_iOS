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
    
    struct AnimationConstants {
        static let Duration = 1.0
    }
    
    func hideCompanyDetails() {
        UIView.animateWithDuration(AnimationConstants.Duration) {
            self.companyNameLabel.hidden = true
            self.companyHeightContraint.constant = 0.0
            self.companyNameLabel.setNeedsDisplay()
        }
    }
    
    func showCompanyDetails() {
        UIView.animateWithDuration(AnimationConstants.Duration) {
            self.companyNameLabel.hidden = false
            self.companyHeightContraint.constant = 21.0
            self.companyNameLabel.setNeedsDisplay()
        }
    }
    
}
