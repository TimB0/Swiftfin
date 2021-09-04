//
 /* 
  * SwiftFin is subject to the terms of the Mozilla Public
  * License, v2.0. If a copy of the MPL was not distributed with this
  * file, you can obtain one at https://mozilla.org/MPL/2.0/.
  *
  * Copyright 2021 Aiden Vigue & Jellyfin Contributors
  */

import Foundation
import UIKit

enum AppReset {
  static func resetKeychain() {
      let secClasses = [
          kSecClassGenericPassword as String,
          kSecClassInternetPassword as String,
          kSecClassCertificate as String,
          kSecClassKey as String,
          kSecClassIdentity as String
      ]
      for secClass in secClasses {
          let query = [kSecClass as String: secClass]
          SecItemDelete(query as CFDictionary)
      }
  }
}

_ = autoreleasepool {
  if ProcessInfo().arguments.contains("--Reset") {
      AppReset.resetKeychain()
  }
  _ = UIApplicationMain(
      CommandLine.argc,
      UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to:
          UnsafeMutablePointer?.self, capacity: Int(CommandLine.argc)),
      nil,
      NSStringFromClass(AppDelegate.self)
  )
}
