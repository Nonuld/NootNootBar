//
//  NootNootBar.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 22/02/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation
import Cocoa

/**
    The representation of the **status bar item** for the app.

    It creates
*/
class NootNootBar: NSObject {

    private var actionsHandler = ActionsHandler.shared

    private var statusItem: NSStatusItem!

    override init() {
        super.init()
        self.registerNotifications()
        self.createStatusItem()
        self.createMenu()
    }

    /**
     Subscription to the needed local notifications
     */
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(launchAtLoginUpdated), name: .launchAtLoginUpdated, object: nil)
    }

    /**
        Creation of the status item that is the point of entry of the app for the user.
    */
    private func createStatusItem() {
        self.statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
        if let button = self.statusItem.button {
            button.image = NSImage(named:"BarIcon")
            button.imageScaling = .scaleProportionallyDown
        }
    }

    /**
        Creation of the menu and its item
    */
    private func createMenu() {
        let menu = NSMenu()
        var menuItem = NSMenuItem(title: "NootNoot", action: #selector(actionsHandler.nootNoot), keyEquivalent: "")
        menuItem.target = actionsHandler
        menu.addItem(menuItem)
        menu.addItem(NSMenuItem.separator())
        menuItem = NSMenuItem(title: NSLocalizedString("launchAtLogin", comment: ""), action: #selector(actionsHandler.updateLaunchAtLogin), keyEquivalent: "")
        menuItem.state = Preferences.shared.launchAtLogin ? .on : .off
        menuItem.target = actionsHandler
        menu.addItem(menuItem)
        menu.addItem(NSMenuItem.separator())
        menuItem = NSMenuItem(title: NSLocalizedString("quit", comment: ""), action: #selector(actionsHandler.terminate), keyEquivalent: "")
        menuItem.target = actionsHandler
        menu.addItem(menuItem)

        self.statusItem.menu = menu
    }
}

extension NootNootBar {
    @objc func launchAtLoginUpdated() {
        DispatchQueue.main.async {
            self.statusItem.menu?.item(withTitle: NSLocalizedString("launchAtLogin", comment: ""))?.state = Preferences.shared.launchAtLogin ? .on : .off
        }
    }
}

public extension Notification.Name {
    static let launchAtLoginUpdated = Notification.Name("launchAtLoginUpdated")
}
