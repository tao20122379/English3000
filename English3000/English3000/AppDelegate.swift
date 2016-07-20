//
//  AppDelegate.swift
//  English3000
//
//  Created by khactao on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //IQKeyboardManager.sharedManager().enable = true
        initializeSomeStuff()
        
        //let statusBar: UIView = UIApplication.sharedApplication().valueForKey("statusBar") as! UIView
        //statusBar.backgroundColor = UIColor.darkGrayColor()
        
        //let mainNavigtionController = UINavigationController(rootViewController: HomeViewController.sharedInstance)
        self.window?.rootViewController = TabbarController()
      //  mainNavigtionController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
       // mainNavigtionController.navigationBar.tintColor = UIColor.whiteColor()
       // mainNavigtionController.interactivePopGestureRecognizer?.enabled = false
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func initializeSomeStuff() {
        // set up uinavigationbar
        UINavigationBar.appearance().barTintColor = UIColor(red: 102/255.0 , green: 204/255.0, blue: 255/255.0, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: FontsHelper.fontHiraKakuProNW6WithSize(16)]
        UINavigationBar.appearance().translucent = false
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }


}

