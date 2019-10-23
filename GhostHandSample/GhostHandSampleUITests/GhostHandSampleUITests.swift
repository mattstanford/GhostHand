//
//  GhostHandSampleUITests.swift
//  GhostHandSampleUITests
//
//  Created by Matt Stanford on 10/22/19.
//  Copyright © 2019 Matt Stanford. All rights reserved.
//

import XCTest

class GhostHandSampleUITests: XCTestCase {

   let app = XCUIApplication()


    func testSample() {
        app.launch()
        wait(for: app.staticTexts["Sample App for 👻"])
        
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        let linkerApp = XCUIApplication(bundleIdentifier: "com.mattstanford.GhostHand")
        linkerApp.launchEnvironment["launchUrl"] = "myTestApp://TEST"
        
        linkerApp.launch()
        
        wait(for: app.staticTexts["Sample App for 👻"])
    }

    func wait(for object: Any, timeInSeconds: TimeInterval = 5) {
         let exists = NSPredicate(format: "exists == true")
         expectation(for: exists, evaluatedWith: object, handler: nil)
         waitForExpectations(timeout: timeInSeconds, handler: nil)
     }
}
