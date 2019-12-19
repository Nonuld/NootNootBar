//
//  Preferences.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 02/06/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation

struct Preferences {

    static let didChangeNotification = Notification.Name("com.alb.NootNootBar.PreferencesChanged")

    private var defaults = UserDefaults.standard

    private func didChange() {
        NotificationCenter.default.post(name: Self.didChangeNotification, object: nil)
    }

    var randomNootNootEnabled: Bool {
        get { defaults.bool(forKey: #function) }
        set {
            defaults.set(newValue, forKey: #function)
            didChange()
        }
    }

    private var appURL: URL { Bundle.main.bundleURL }
    
    var launchAtLoginEnabled: Bool {
        get { SharedFileList.sessionLoginItems().containsItem(appURL) }
        set {
            if newValue {
                SharedFileList.sessionLoginItems().addItem(appURL)
            } else {
                SharedFileList.sessionLoginItems().removeItem(appURL)
            }

            didChange()
        }
    }
}

enum PreferencesKey: String {
    case launchAtLogin
}
