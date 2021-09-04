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

enum SettingsScreen: String {
    case signOutButton = "Sign out"
    
    var element: XCUIElement {
        switch self {
        case .signOutButton:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}

enum HomeScreen: String {
    case settingsButton = "settings"
    
    var element: XCUIElement {
        switch self {
        case .settingsButton:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}

enum ConnecToServerScreen: String {
    case serverURL = "Server URL"
    case username = "Username"
    case connectButton = "Connect"
    case loginButton = "Login"
    case signOutButton = "Sign out"
    case loginText = "LOGIN TO STABLE DEMO"
    case connectToServer = "Connect to Server"
    case password = "Password"
    
    var element: XCUIElement {
        switch self {
        case .serverURL, .username:
            return XCUIApplication().textFields[self.rawValue]
        case .connectButton, .loginButton, .signOutButton:
            return XCUIApplication().buttons[self.rawValue]
        case .loginText, .connectToServer:
            return XCUIApplication().staticTexts[self.rawValue]
        case .password:
            return XCUIApplication().secureTextFields[self.rawValue]
        }
    }
}
