//
//  GhostHandSampleUITests3.swift
//  GhostHandSampleUITests
//
//  Created by Matt Stanford on 11/6/19.
//  Copyright © 2019 Matt Stanford. All rights reserved.
//

import XCTest
import GhostHandLib

/*
 Duplicate of other UI test class so we can test multiple cloned simulators
 */

class GhostHandSampleUITests3: XCTestCase {

   let app = XCUIApplication()


    func testSample() {
        app.launch()
        let appBooted = app.staticTexts["Sample App for 👻"].waitForExistence(timeout: 5)
        XCTAssert(appBooted)
        
        //Tap the home button to put the app under test in the background
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        
        //Use the GhostHand companion app to launch the custom scheme
        GhostHand.launch(url: "ghostHandSampleApp://TEST")
        
        //The app should be called by the GhostHand companion app
        let appShowedAgain = app.staticTexts["Sample App for 👻"].waitForExistence(timeout: 5)
        XCTAssert(appShowedAgain)

    }
}
