//
//  MainController.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 28/10/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa

class MainController: NSViewController {

    @IBOutlet var gifImageView: NSImageView!
    @IBOutlet var settingsButton: NSButton!

    private var nootNootController: NootNootController!
    private var preferences: Preferences!

    static func instantiate(with nootNootController: NootNootController, and preferences: Preferences) -> MainController {
        let storyboard = NSStoryboard(name: "Controllers", bundle: nil)
        guard let mainController = storyboard.instantiateController(withIdentifier: "MainController") as? MainController else {
            fatalError("Unable to find MainController in the storyboard.")
        }

        mainController.nootNootController = nootNootController
        mainController.preferences = preferences

        return mainController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureGifImageView()
        setupNotifications()
    }

    private func configureGifImageView() {
        gifImageView.canDrawSubviewsIntoLayer = true
        gifImageView.imageScaling = .scaleProportionallyDown
        gifImageView.animates = true
        gifImageView.image = NSImage(named: "noot")
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(forName: Preferences.didChangeNotification, object: nil, queue: nil) { _ in
            if self.preferences.randomNootNootEnabled {
                self.nootNootController.beginTheRandomizer()
            } else {
                self.nootNootController.stopTheRandomizer()
            }
        }
    }

    @IBAction func didTouchGif(_ sender: Any) {
        nootNootController.playNootNoot()
    }

    @IBAction func didTouchSettings(_ sender: Any) {
        let settingsController = SettingsViewController.instantiate(with: preferences)

        let popoverView = NSPopover()
        popoverView.contentViewController = settingsController
        popoverView.behavior = .transient
        popoverView.show(relativeTo: settingsButton.bounds, of: settingsButton, preferredEdge: .maxY)
    }
}
