//
//  AppDelegate.swift
//  GhostHand
//
//  Created by Matt Stanford on 10/22/19.
//  Copyright © 2019 Matt Stanford. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         launchToPassedInUrl()
         return true
     }

     private func launchToPassedInUrl() {
         guard let urlString = ProcessInfo.processInfo.environment["launchUrl"],
             let url = URL(string: urlString) else {
             return
         }
         UIApplication.shared.open(url, options: [:], completionHandler: nil)
     }
}

