//
//  AppDelegate.swift
//  Example
//
//  Created by xaoxuu on 2018/6/15.
//  Copyright © 2018 Titan Studio. All rights reserved.
//

import UIKit
import ProHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = RootVC()
        window?.makeKeyAndVisible()
        
        ProHUD.config { (cfg) in
            cfg.rootViewController = window!.rootViewController
            cfg.alert { (a) in
                a.titleFont = .bold(22)
                a.bodyFont = .regular(17)
                a.boldTextFont = .bold(18)
                a.buttonFont = .bold(18)
                a.forceQuitTimer = 3
            }
            cfg.toast { (t) in
                t.titleFont = .bold(18)
                t.bodyFont = .regular(16)
            }
            cfg.guard { (g) in
                g.titleFont = .bold(22)
                g.subTitleFont = .bold(20)
                g.bodyFont = .regular(17)
                g.buttonFont = .bold(18)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NotificationCenter.default.post(name: NSNotification.Name.init("applicationDidEnterBackground"), object: nil)
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension ProHUD.Scene {
    static var confirm: ProHUD.Scene {
        var scene = ProHUD.Scene(identifier: "confirm")
        scene.image = UIImage(named: "ProHUDMessage")
        return scene
    }
    static var delete: ProHUD.Scene {
        var scene = ProHUD.Scene(identifier: "delete")
        scene.image = UIImage(named: "ProHUDTrash")
        scene.title = "确认删除"
        scene.message = "此操作不可撤销"
        return scene
    }
    static var buy: ProHUD.Scene {
        var scene = ProHUD.Scene(identifier: "buy")
        scene.image = UIImage(named: "ProHUDBuy")
        scene.title = "确认付款"
        scene.message = "一旦购买拒不退款"
        return scene
    }
}
