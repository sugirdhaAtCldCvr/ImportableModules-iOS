//
//  AppDelegate.swift
//  ImportableModules_iOS
//
//  Created by Sugirdha Vaithyanathan on 11/1/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let mainVc = ProgressBarViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let navigationController = UINavigationController(rootViewController: mainVc)
        window?.rootViewController = navigationController
        
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        
        return true
    }


}

