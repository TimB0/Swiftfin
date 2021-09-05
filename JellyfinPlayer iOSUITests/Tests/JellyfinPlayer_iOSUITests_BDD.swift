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

class BDDTest: TestBase {
    
    func testConnectToServerInBDDStyle() {
        givenWhenAppIsReady()
        whenIEnterServerAddress(serverAddress: "https://demo.jellyfin.org/stable")
        whenIClickConnect()
        thenIWillLogin(username: "demo")
        thenIWillPlayAMovie()
        thenIWillLogOut()
    }
}
    
