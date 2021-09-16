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
import EyesXCUI

extension TestBase {
    func givenWhenAppIsReady() {
        XCTContext.runActivity(named: "Given App is Ready") { _ in
            XCTAsyncAssert(ConnecToServerScreen.serverURL.element)
        }
    }
    
    func whenIEnterServerAddress(serverAddress: String) {
        XCTContext.runActivity(named: "When I Enter Server Address") { _ in
            ConnecToServerScreen.serverURL.element.tap()
            ConnecToServerScreen.serverURL.element.typeText(serverAddress)
        }
    }
    
    func whenIClickConnect() {
        XCTContext.runActivity(named: "When I Click Connect") { _ in
            XCTAssertTrue(ConnecToServerScreen.connectButton.element.isEnabled)
            ConnecToServerScreen.connectButton.element.tap()
        }
    }
    
    func  thenIWillLogin(username: String)  {
        XCTContext.runActivity(named: "Then I Will Login") { _ in
            ConnecToServerScreen.loginText.element.tap()
            XCTAssertTrue(ConnecToServerScreen.loginText.element.exists)
            XCTAssertFalse(ConnecToServerScreen.loginButton.element.isEnabled)
            XCTAssertTrue(ConnecToServerScreen.username.element.isEnabled)
            ConnecToServerScreen.username.element.tap()
            ConnecToServerScreen.username.element.typeText(username)
            XCTAssertTrue(ConnecToServerScreen.password.element.exists)
            XCTAssertTrue(ConnecToServerScreen.loginButton.element.isEnabled)
            ConnecToServerScreen.loginButton.element.tap()
        }
    }
    
    func thenIWillPlayAMovie(videoLength: String) {
        XCTAsyncAssert(HomeScreen.allMediaButton.element)
        HomeScreen.allMediaButton.element.tap()
        XCTAsyncAssert(HomeScreen.homeButton.element)
        HomeScreen.homeButton.element.tap()
//        XCTAsyncAssert(HomeScreen.sixPageScrollBar.element)
//        HomeScreen.sixPageScrollBar.element.swipeLeft()
//        XCTAsyncAssert(HomeScreen.ladyFrankenSteinHomeText.element)
//        HomeScreen.ladyFrankenSteinHomeText.element.tap()
//        XCUIApplication().buttons[videoLength].tap()
        
        
    }
    
    func thenIWillLogOut() {
        XCTContext.runActivity(named: "Then I Will Log Out") { _ in
            HomeScreen.settingsButton.element.tap()
            XCTAssertTrue(SettingsScreen.signOutButton.element.exists)
            /* TODO:  Need to find out why the Sign Out button doesnt work unless you
            wait for 30 seconds before and 5 seconds after */
            Thread.sleep(forTimeInterval: 30)
            SettingsScreen.signOutButton.element.tap()
            Thread.sleep(forTimeInterval: 5)
            ConnecToServerScreen.connectToServer.element.tap()
        }
    }
}

