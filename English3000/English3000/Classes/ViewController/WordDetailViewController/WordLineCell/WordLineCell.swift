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
            break
        case .WordLineTypeTitle:
            self.titleLabel.text = title
            break
        case .WordLineTypeDetail1:
            self.titleLabel.text = title
            self.titleLabel.font = UIFont.boldSystemFontOfSize(15.0)
            break
        case .WordLineTypeDetail2:
            self.titleLabel.text = "    " + title
           self.titleLabel.font = UIFont.italicSystemFontOfSize(15.0)
            break
        default:
            self.titleLabel.text = ""
            break
            
        }
    }
    
}
