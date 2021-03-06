/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import MaterialComponents.MaterialThemes

final class AppTheme {
  let colorScheme: MDCColorScheme

  init(colorScheme: MDCColorScheme) {
    self.colorScheme = colorScheme
  }

  static let defaultTheme = AppTheme(colorScheme:
    MDCBasicColorScheme(primaryColor: MDCPalette.purple.tint500,
                        primaryLightColor: MDCPalette.purple.tint100,
                        primaryDarkColor: MDCPalette.purple.tint900)
  )

  static var globalTheme = defaultTheme {
    didSet {
      NotificationCenter.default.post(name: AppTheme.didChangeGlobalThemeNotificationName,
                                      object: nil,
                                      userInfo:
        [AppTheme.globalThemeNotificationColorSchemeKey: AppTheme.globalTheme.colorScheme]
      )
    }
  }

  static let didChangeGlobalThemeNotificationName = Notification.Name("MDCCatalogDidChangeGlobalTheme")
  static let globalThemeNotificationColorSchemeKey = "colorScheme"
}
