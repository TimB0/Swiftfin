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
            XCTAssertTrue(ConnecToServerScreen.serverURL.element.exists)
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
    
    func thenIWillLogOut() {
        XCTContext.runActivity(named: "Then I Will Log Out") { _ in
            HomeScreen.settingsButton.element.tap()
            SettingsScreen.signOutButton.element.tap()
            ConnecToServerScreen.connectToServer.element.tap()
            // app.navigationBars["Connect to Server"].staticTexts["Connect to Server"].tap()
        }
    }
}

