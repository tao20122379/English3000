//
//  TabbarController.swift
//  SoundWorld
//
//  Created by PaditechDev1 on 3/31/16.
//  Copyright © PaditechDev1. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController , UITabBarControllerDelegate{
    
    //MARK: - Variable and IBOutlet
    var lastSelectedIndex : NSInteger = 0
    var tabbarHeight : CGFloat = 0.0
    @IBOutlet var footerView : UIView?
    
    //MARK: - Life cycle
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTabbarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Init tabbar item
    func initTabbarItem()-> Void {
        
        // Set tintColor
        self.tabBar.tintColor = Constants().Rgb2UIColor(175, green: 126, blue: 228)
        
        // Setup ViewController1
        let vc1 = NSBundle.mainBundle().loadNibNamed("HomeViewController", owner: self, options: nil).first as! HomeViewController
        
        vc1.view.backgroundColor = UIColor.yellowColor()
        vc1.title = Constants().LANGTEXT("TITLE_HOME")
        let icon1 = UITabBarItem(title: Constants().LANGTEXT("TITLE_HOME"), image: UIImage(named: "mb")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "pv")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc1.tabBarItem = icon1
        
        
       let vc2 = NSBundle.mainBundle().loadNibNamed("HomeViewController", owner: self, options: nil).first as! HomeViewController
        vc2.view.backgroundColor = UIColor.yellowColor()
        vc2.title = Constants().LANGTEXT("TITLE_HOME")
        let icon2 = UITabBarItem(title: Constants().LANGTEXT("TITLE_HOME"), image: UIImage(named: "mb")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "pv")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc2.tabBarItem = icon2
        
        let vc3 = NSBundle.mainBundle().loadNibNamed("HomeViewController", owner: self, options: nil).first as! HomeViewController
        vc3.view.backgroundColor = UIColor.yellowColor()
        vc3.title = Constants().LANGTEXT("TITLE_HOME")
        let icon3 = UITabBarItem(title: Constants().LANGTEXT("TITLE_HOME"), image: UIImage(named: "mb")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "pv")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc3.tabBarItem = icon3


        /*
        // Setup ViewController2
        let vc2 = CategoryViewController(nibName: "CategoryViewController", bundle: nil)
        vc2.title = Constants().LANGTEXT("TITLE_CATEGORY")
        let icon2 = UITabBarItem(title: Constants().LANGTEXT("TITLE_CATEGORY"), image: UIImage(named: "tabbar_icon_category_off")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_category_on")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc2.tabBarItem = icon2
        
    
        // Setup ViewController5
        let otherViewController = OtherViewController(nibName: "OtherViewController", bundle: nil)
        otherViewController.view.backgroundColor = UIColor.brownColor()
        otherViewController.title = Constants().LANGTEXT("TITLE_OTHER")
        let tabbarItemOther = UITabBarItem(title: Constants().LANGTEXT("TITLE_OTHER"), image: UIImage(named: "tabbar_icon_other_off")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_other_on")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        otherViewController.tabBarItem = tabbarItemOther
          */
        // Navigation
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        self.viewControllers = [nav1, nav2, nav3]
 
    }
    
    //MARK: - Custom tabbar
    func initComponent()-> Void {
        let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
        let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
        
        if(SCREEN_HEIGHT <= 568){
            tabbarHeight = 49
        } else if (SCREEN_HEIGHT <= 667){
            tabbarHeight = 60
        } else {
            tabbarHeight = 65
        }
        
        // Setup ViewController
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.yellowColor()
        vc1.title = Constants().LANGTEXT("TITLE_HOME")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.greenColor()
        vc2.title = Constants().LANGTEXT("TITLE_CATEGORY")
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.blueColor()
        vc3.title = Constants().LANGTEXT("TITLE_POST")
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.orangeColor()
        vc4.title = Constants().LANGTEXT("TITLE_MY_PAGE")
        
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor.brownColor()
        vc5.title = Constants().LANGTEXT("TITLE_OTHER")
        
        // Navigation
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        self.viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
        lastSelectedIndex = 0
        
        // Settup tabbar
        footerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.size.width,  tabbarHeight))
        footerView?.backgroundColor = UIColor.whiteColor()
        let numberOfButton = 5
        let buttonImageArray = ["tabbar_icon_home", "tabbar_icon_category", "tabbar_qbutton", "tabbar_icon_my", "tabbar_icon_other"]
        
        for i in 0...numberOfButton - 1{
            let buttonName : String = buttonImageArray[i];
            let buttonFrame = CGRectMake(SCREEN_WIDTH/5 * CGFloat(i), 0, SCREEN_WIDTH/5, tabbarHeight)
            let button = customButton(buttonFrame, imageNamed: buttonName)
            button.tag = i + 10
            footerView?.addSubview(button)
            if i == 0 {
                buttonTapped(button)
            }
        }
        
        self.tabBar.addSubview(footerView!)
        UITabBar.appearance().backgroundColor = UIColor.whiteColor()
        
    }
    
    
    func customButton(frame : CGRect, imageNamed: String)-> UIButton{
        let button = UIButton(frame: frame)
        let normalEndStr : String = imageNamed != "tabbar_qbutton" ? "_off":""
        let selectedEndStr : String = imageNamed != "tabbar_qbutton" ? "_on":""
        
        button.setImage(UIImage(named: imageNamed.stringByAppendingString(normalEndStr)) , forState: UIControlState.Normal)
       
        button.setImage(UIImage(named: imageNamed.stringByAppendingString(selectedEndStr)), forState: UIControlState.Selected);
        button.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        button.titleLabel?.textColor = UIColor.redColor()
        return button
    }
    
    func buttonTapped(button : UIButton)->Void{
        
        let selectedIndex = button.tag - 10
        
        // Select the view
        self.selectedIndex = selectedIndex
        
        // Last button
        let lastButton = self.footerView?.viewWithTag(lastSelectedIndex + 10) as! UIButton
        
        // Set last button
        lastButton.selected = false
        
        // current button
        button.selected = true
        
        lastSelectedIndex = selectedIndex
    }
}
