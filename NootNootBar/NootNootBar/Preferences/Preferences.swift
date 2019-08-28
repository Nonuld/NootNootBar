//
//  Preferences.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 02/06/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation

struct Preferences {

    static var shared = Preferences()

    private init() {}

    var launchAtLogin: Bool {
        get { return UserDefaults.standard.bool(forKey: PreferencesKey.launchAtLogin) }
        set { UserDefaults.standard.set(newValue, forKey: PreferencesKey.launchAtLogin) }
    }
}

enum PreferencesKey {
    static var launchAtLogin = "launchAtLogin"
}
