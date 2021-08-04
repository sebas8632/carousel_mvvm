//
//  AppDelegate.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appDIContainer = AppDIContainer()
    var appCoordinator: AppCoordinator?
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        appCoordinator = AppCoordinator(window: window!, appDIContainer: appDIContainer)
        appCoordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}
