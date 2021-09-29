
 /* 
  * SwiftFin is subject to the terms of the Mozilla Public
  * License, v2.0. If a copy of the MPL was not distributed with this
  * file, you can obtain one at https:mozilla.org/MPL/2.0/.
  *
  * Copyright 2021 Timothy Boland & Jellyfin Contributors
  */




import XCTest

class JellyfinPlayer_iOSUITests: TestBase {

    func testAllElementsOnConnecToServerScreen() throws {
        
        XCTAssertFalse(app.buttons["Connect"].isEnabled)
        app.staticTexts["DISCOVERED SERVERS"].tap()
        app.buttons["Connect"].tap()
        XCTAssertFalse(app.buttons["Connect"].isEnabled)
        app.textFields["Server URL"].tap()
        app.staticTexts["CONNECT MANUALLY"].tap()
        app.navigationBars["Connect to Server"].staticTexts["Connect to Server"].tap()
                
    }
    
    func testEnterServerAddress() {
        
        app.textFields["Server URL"].tap()
        app.textFields["Server URL"].typeText("https:demo.jellyfin.org/stable")
        XCTAssertTrue(app.buttons["Connect"].isEnabled)
        app.buttons["Connect"].tap()
        app.staticTexts["LOGIN TO STABLE DEMO"].tap()
        XCTAssertTrue(app.staticTexts["LOGIN TO STABLE DEMO"].exists)

    }
}

 

