//
//  GhostHand.swift
//  GhostHandLib
//
//  Created by Matt Stanford on 11/3/19.
//  Copyright © 2019 Matt Stanford. All rights reserved.
//

import Foundation
import XCTest

public class GhostHand {
    
    static public func launch(url: String) {
        let linkerApp = XCUIApplication(bundleIdentifier: "com.mattstanford.GhostHand")
        linkerApp.launchEnvironment["launchUrl"] = url
        linkerApp.launch()
    }
}
