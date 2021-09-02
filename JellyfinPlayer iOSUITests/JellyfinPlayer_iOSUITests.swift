//
 /* 
  * SwiftFin is subject to the terms of the Mozilla Public
  * License, v2.0. If a copy of the MPL was not distributed with this
  * file, you can obtain one at https://mozilla.org/MPL/2.0/.
  *
  * Copyright 2021 Aiden Vigue & Jellyfin Contributors
  */

import XCTest

class JellyfinPlayer_iOSUITests: TestBase {

    func testAllElementsOnConnecToServerScreen() throws {
        
        XCTAssertFalse(app.buttons["Connect"].isEnabled)
        app.staticTexts["DISCOVERED SERVERS"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Connect"]/*[[".cells[\"Connect\"].buttons[\"Connect\"]",".buttons[\"Connect\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertFalse(app.buttons["Connect"].isEnabled)
        app/*@START_MENU_TOKEN@*/.textFields["Server URL"]/*[[".cells[\"Server URL\"].textFields[\"Server URL\"]",".textFields[\"Server URL\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["CONNECT MANUALLY"].tap()
        app.navigationBars["Connect to Server"].staticTexts["Connect to Server"].tap()
                
    }
    
    func testEnterServerAddress() {
        
        app/*@START_MENU_TOKEN@*/.textFields["Server URL"]/*[[".cells[\"Server URL\"].textFields[\"Server URL\"]",".textFields[\"Server URL\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Server URL"].typeText("https://demo.jellyfin.org/stable")
        XCTAssertTrue(app.buttons["Connect"].isEnabled)
        app.buttons["Connect"].tap()
        app.staticTexts["LOGIN TO STABLE DEMO"].tap()
        XCTAssertTrue(app.staticTexts["LOGIN TO STABLE DEMO"].exists)

    }
}
