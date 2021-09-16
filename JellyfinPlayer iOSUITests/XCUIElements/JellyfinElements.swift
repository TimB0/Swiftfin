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
    case homeButton = "Home"
    case allMediaButton = "All Media"
    case settingsButton = "settings"
    case ladyFrankenSteinLatestMoviesText = "Lady Frankenstein, 1971 • R"
    case ladyFrankenSteinHomeText = "Lady Frankenstein"
    case sixPageScrollBar = "Vertical scroll bar, 6 pages"
    
    var element: XCUIElement {
        switch self {
        case .homeButton:
            return XCUIApplication().buttons[self.rawValue]
        case .allMediaButton:
            return XCUIApplication().buttons[self.rawValue]
        case .sixPageScrollBar:
            return XCUIApplication().otherElements[self.rawValue]
        case .settingsButton:
            return XCUIApplication().buttons[self.rawValue]
        case .ladyFrankenSteinHomeText:
            return XCUIApplication().buttons[self.rawValue]
        case .ladyFrankenSteinLatestMoviesText:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}


enum ConnecToServerScreen: String {
    case serverURL = "Server URL Field"
    case username = "Username Field"
    case connectButton = "Connect Button"
    case loginButton = "Login Button"
    case signOutButton = "Sign out"
    case loginText = "LOGIN TO STABLE DEMO"
    case connectToServer = "Connect to Server"
    case password = "Secure Password Field"
    
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
