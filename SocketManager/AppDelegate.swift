//
//  AppDelegate.swift
//  SocketManager
//
//  Created by Santhosh Kumar on 27/02/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Connect Socket
        SocketIOManager.establishConnection()
        
        //Set RootViewController
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = (mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
        
        navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        SocketIOManager.establishConnection()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        
        SocketIOManager.closeConnection()
    }
}

