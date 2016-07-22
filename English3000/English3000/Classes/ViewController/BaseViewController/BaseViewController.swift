//
//  BaseViewController.swift
//  Chishiki Shindan
//
//  Created by PaditechDev1 on 6/29/16.
//  Copyright © 2016 Paditech. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    //MARK: Variable and IBOutlet
    var indexOfMyController: Int?
    var result: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - custom LeftBarButtonItem
    internal func createLeftBarButton(imageName:String, target:AnyObject, sel:Selector) {
        let image: UIImage = UIImage(named: imageName)!
        let leftButton: UIButton = UIButton(type: UIButtonType.Custom)
        leftButton.frame = CGRectMake(0, 0, image.size.width, image.size.height)
        leftButton.setImage(UIImage(named:imageName), forState: UIControlState.Normal)
        leftButton.addTarget(target, action: sel, forControlEvents: UIControlEvents.TouchUpInside)
        
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    internal func createLeftBarButtonWithName(buttonName: String, target: AnyObject, sel:Selector) {
        let leftButton: UIButton = UIButton(type: UIButtonType.Custom)
        leftButton.setTitle(buttonName, forState: UIControlState.Normal)
        leftButton.frame = CGRectMake(0, 0, 60, 40)
        leftButton.addTarget(target, action: sel, forControlEvents: UIControlEvents.TouchUpInside)
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    //MARK: - custom RightBarButtonItem
    internal func createRightBarButton(imageName:String, target:AnyObject, sel:Selector) {
        let image: UIImage = UIImage(named: imageName)!
        let rightButton: UIButton = UIButton(type: UIButtonType.Custom)
        rightButton.frame = CGRectMake(0, 0, image.size.width, image.size.height)
        rightButton.setImage(UIImage(named:imageName), forState: UIControlState.Normal)
        rightButton.setTitle("", forState: UIControlState.Normal)
        rightButton.addTarget(target, action: sel, forControlEvents: UIControlEvents.TouchUpInside)
        
        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    internal func createRightBarButtonWithName(buttonName: String, target: AnyObject, sel:Selector) {
        let rightButton: UIButton = UIButton(type: UIButtonType.Custom)
        rightButton.setTitle(buttonName, forState: UIControlState.Normal)
        rightButton.frame = CGRectMake(0, 0, 60, 40)
        rightButton.addTarget(target, action: sel, forControlEvents: UIControlEvents.TouchUpInside)
        
        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

   
}
