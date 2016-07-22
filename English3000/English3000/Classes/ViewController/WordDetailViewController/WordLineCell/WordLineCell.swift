//
//  WordLineCell.swift
//  English3000
//
//  Created by khactao on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class WordLineCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initWithTitle(title: String) {
        switch Constants().checkWordLineType(title) {
        case .WordLineTypeName:
            self.titleLabel.text = title
            self.titleLabel.textColor = UIColor.redColor()
            break
        case .WordLineTypeTitle:
            self.titleLabel.text = title
             self.titleLabel.textColor = UIColor.colorFromHexString("#00CC00")
            break
        case .WordLineTypeDetail1:
            self.titleLabel.text = title
            self.titleLabel.font = UIFont.boldSystemFontOfSize(15.0)
             self.titleLabel.textColor = UIColor.blackColor()
            break
        case .WordLineTypeDetail2:
            self.titleLabel.text = "    " + title
            self.titleLabel.font = UIFont.italicSystemFontOfSize(15.0)
             self.titleLabel.textColor = UIColor.blackColor()
            break
        default:
            self.titleLabel.text = ""
             self.titleLabel.textColor = UIColor.blackColor()
            break
            
        }
    }
    
}
