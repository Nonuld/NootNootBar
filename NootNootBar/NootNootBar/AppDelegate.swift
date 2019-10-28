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

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    // https://www.youtube.com/watch?v=ii89L7LVAs4

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = self.statusItem.button {
            button.image = NSImage(named:"BarIcon")
            button.imageScaling = .scaleProportionallyDown
            button.target = self
            button.action = #selector(showController)
        }

        LaunchAtLogin.isEnabled = Preferences.shared.launchAtLogin
    }

    @objc private func showController() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "MainController") as? MainController else {
            fatalError("Unable to find MainController in the storyboard.")
        }

        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button.")
        }

        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }

}

