//
//  DetailSentenceTableViewCell.swift
//  English3000
//
//  Created by HoangDuoc on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

protocol EventOfCellSentence {
    func handleEventDidTapSound(tag: Int)
    
}

class DetailSentenceTableViewCell: UITableViewCell {

    @IBOutlet var lbSentence_en: UILabel!
    @IBOutlet var lbSentence_vi: UILabel!
    @IBOutlet var btSound: UIButton!
    var delegate: EventOfCellSentence?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func soundDidTapped(sender: UIButton) {
       self.delegate?.handleEventDidTapSound(self.tag)
    }
}
