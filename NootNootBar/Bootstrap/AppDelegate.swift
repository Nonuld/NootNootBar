//
//  AppDelegate.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 28/08/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    private lazy var preferences = Preferences()
    private lazy var nootNootController = NootNootController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = self.statusItem.button {
            button.image = NSImage(named:"BarIcon")
            button.imageScaling = .scaleProportionallyDown
            button.target = self
            button.action = #selector(showMainController)
        }

        nootNootController.beginTheRandomizer()
    }

    @objc private func showMainController() {
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button.")
        }

        let mainController = MainController.instantiate(with: nootNootController)

        let popoverView = NSPopover()
        popoverView.contentViewController = mainController
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
        
        NSApp.activate(ignoringOtherApps: true)
    }

}

