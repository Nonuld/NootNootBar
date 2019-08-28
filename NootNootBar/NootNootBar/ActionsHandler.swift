//
//  ActionsHandler.swift
//  MusicalBar
//
//  Created by Arnaud Le Bourblanc on 19/02/2018.
//  Copyright © 2018 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation
import Cocoa
import LaunchAtLogin

/**
    Handle the differents actions possible
*/
class ActionsHandler {

    static let shared = ActionsHandler()

    private init() {}

    /**
     **Activate** or **deactivate** the notifications
     */
    @objc public func nootNoot() {
        NootNootManager.shared.playNootNoot()
    }

    /**
     **Update** the **LaunchAtLogin** state
     */
    @objc public func updateLaunchAtLogin() {
        var preferences = Preferences.shared
        let oldValue = preferences.launchAtLogin
        preferences.launchAtLogin = !oldValue
        LaunchAtLogin.isEnabled = !oldValue
        NotificationCenter.default.post(name: .launchAtLoginUpdated, object: nil)
    }

    /**
        **Kill** the application
    */
    @objc public func terminate() {
        NSApplication.shared.terminate(nil)
    }
}
