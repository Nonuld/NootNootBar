//
//  SettingsViewController.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 19/12/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    @IBOutlet var launchAtLoginCheckBox: NSButton!
    @IBOutlet var randomCheckBox: NSButton!

    private var preferences: Preferences!

    static func instantiate(with preferences: Preferences) -> SettingsViewController {
        let storyboard = NSStoryboard(name: "Controllers", bundle: nil)
        guard let settingsController = storyboard.instantiateController(withIdentifier: "SettingsController") as? SettingsViewController else {
            fatalError("Unable to find SettingsController in the storyboard.")
        }

        settingsController.preferences = preferences

        return settingsController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        launchAtLoginCheckBox.state = preferences.launchAtLoginEnabled ? .on : .off
        launchAtLoginCheckBox.title = NSLocalizedString("launchAtLogin", comment: "")
        randomCheckBox.state = preferences.randomNootNootEnabled ? .on : .off
        randomCheckBox.title = NSLocalizedString("random", comment: "")
    }

    override func viewDidDisappear() {
        super.viewDidDisappear()
        NSApp.activate(ignoringOtherApps: true)
    }

    @IBAction func didTouchLaunchAtLogin(_ sender: NSButton) {
        preferences.launchAtLoginEnabled = sender.state == .on ? true : false
    }

    @IBAction func didTouchRandom(_ sender: NSButton) {
        preferences.randomNootNootEnabled = sender.state == .on ? true : false
    }
    
}
