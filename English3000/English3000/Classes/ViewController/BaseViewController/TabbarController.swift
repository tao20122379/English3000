//
//  TabbarController.swift
//  SoundWorld
//
//  Created by PaditechDev1 on 3/31/16.
//  Copyright © PaditechDev1. All rights reserved.
//

import UIKit
import AVFoundation


class TabbarController: UITabBarController , UITabBarControllerDelegate{
    
    //MARK: - Variable and IBOutlet
    var lastSelectedIndex : NSInteger = 0
    var tabbarHeight : CGFloat = 0.0
    let synthesizer = AVSpeechSynthesizer()

    @IBOutlet var footerView : UIView?
    
    //MARK: - Life cycle
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tabBar.selectionIndicatorImage = UIImage(named: "tabbar_selected@2x")
        self.tabBar.backgroundColor = UIColor.whiteColor()
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)
        initTabbarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Init tabbar item
    func initTabbarItem()-> Void {
        
        // Set tintColor
        
        // Setup ViewController1
        let vc1 = WordViewController(nibName: "WordViewController", bundle: nil) 
        vc1.title = "Từ thông dụng"
        let icon1 = UITabBarItem(title: "Từ thông dụng", image: UIImage(named: "tabbar_word@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tabbar_word_select@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc1.tabBarItem = icon1
        
       let vc2 = SentenceViewController(nibName: "SentenceViewController", bundle: nil)
        vc2.title = "Câu thông dụng"
        let icon2 = UITabBarItem(title: "Câu thông dụng", image: UIImage(named: "tabbar_sentence@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tabbar_sentence_select@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc2.tabBarItem = icon2
        
        let vc3 = MarkViewController(nibName: "MarkViewController", bundle: nil)
        vc3.title = "Đánh dấu"
        let icon3 = UITabBarItem(title: "Đánh dấu", image: UIImage(named: "tabbar_history@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tabbar_history_select@2x")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        vc3.tabBarItem = icon3

        // Navigation
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        self.viewControllers = [nav1, nav2, nav3]
 
    }
    
    func CreateTextToSpeech(text: String) {
        self.synthesizer.stopSpeakingAtBoundary(.Immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-IE")
        
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
        {
            utterance.rate = 0.1;
        } else {
            utterance.rate = 0.1;
        }
        self.synthesizer.speakUtterance(utterance)
    }
}
    

