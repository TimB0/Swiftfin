//
 /* 
  * SwiftFin is subject to the terms of the Mozilla Public
  * License, v2.0. If a copy of the MPL was not distributed with this
  * file, you can obtain one at https://mozilla.org/MPL/2.0/.
  *
  * Copyright 2021 Timothy Boland & Jellyfin Contributors
  */

import Foundation
import XCTest

class TestBase: XCTestCase {
    
    var app = XCUIApplication()
    
    func XCTAsyncAssert(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        
        if isElementExist {
            XCTAssertTrue(element.exists)
        }
    }
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        

        
    }

    override func tearDownWithError() throws {
        takeScreenshot()
        super.tearDown()
        
        if SettingsScreen.signOutButton.element.exists {
            XCTAssertTrue(SettingsScreen.signOutButton.element.exists)
            // TODO:  Need to investigate why we are not able to click on the Sign Out Button without waiting for 30 seconds
            Thread.sleep(forTimeInterval: 30)
            SettingsScreen.signOutButton.element.tap()
            Thread.sleep(forTimeInterval: 5)
            app.terminate()
            return
        }
        
        if HomeScreen.settingsButton.element.exists {
            HomeScreen.settingsButton.element.tap()
            XCTAssertTrue(SettingsScreen.signOutButton.element.exists)
            // TODO:  Need to investigate why we are not able to click on the Sign Out Button without waiting for 30 seconds
            Thread.sleep(forTimeInterval: 30)
            SettingsScreen.signOutButton.element.tap()
            Thread.sleep(forTimeInterval: 5)
            app.terminate()
            return
        }
    }
    
    func takeScreenshot() {
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        
        add(screenshot)
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//             measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
