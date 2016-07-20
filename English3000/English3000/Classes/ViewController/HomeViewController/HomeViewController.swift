//
//  HomeViewController.swift
//  atmSwift
//
//  Created by khactao on 6/13/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController: BaseViewController {
    
    
    // MARK: - Static init
    static let sharedInstance = NSBundle.mainBundle().loadNibNamed("HomeViewController", owner: nil, options: nil).first as! HomeViewController
    
    
    // MARK: - Life Cycle
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}






