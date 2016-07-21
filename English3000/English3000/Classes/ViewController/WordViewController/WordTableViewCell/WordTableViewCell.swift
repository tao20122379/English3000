//
//  WordTableViewCell.swift
//  English3000
//
//  Created by HoangDuoc on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

enum MarkState {
    case Check
    case None
}

class WordTableViewCell: UITableViewCell {

    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbRead: UILabel!
    @IBOutlet var lbCategory: UILabel!
    @IBOutlet var lbViContent: UILabel!
    @IBOutlet var btStar: UIButton!
    var state = MarkState.None
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func soundDidTapped(sender: UIButton) {
        print("sound")
    }
    @IBAction func starDidTapped(sender: UIButton) {
        print("star")

        if self.state == MarkState.None {
            self.btStar.setImage(UIImage(named: "favorite-select"), forState: .Normal)
            self.state = MarkState.Check
        }else {
            self.btStar.setImage(UIImage(named: "favorite"), forState: .Normal)
            self.state = MarkState.None
        }
    }
}
