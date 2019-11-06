//
//  GhostHandSampleUITests.swift
//  GhostHandSampleUITests
//
//  Created by Matt Stanford on 10/22/19.
//  Copyright © 2019 Matt Stanford. All rights reserved.
//

import XCTest
import GhostHandLib

class GhostHandSampleUITests: XCTestCase {

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
