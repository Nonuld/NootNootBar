//
//  AppDelegate.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 28/08/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa
import LaunchAtLogin

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var nootNootBar: NootNootBar!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.nootNootBar = NootNootBar()

        LaunchAtLogin.isEnabled = Preferences.shared.launchAtLogin
    }

}

