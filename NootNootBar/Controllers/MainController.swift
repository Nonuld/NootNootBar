//
//  MainController.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 28/10/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa

class MainController: NSViewController {

    @IBOutlet weak var gifImageView: NSImageView!

    private var nootNootController: NootNootController!

    static func instantiate(with nootNootController: NootNootController) -> MainController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let mainController = storyboard.instantiateController(withIdentifier: "MainController") as? MainController else {
            fatalError("Unable to find MainController in the storyboard.")
        }

        mainController.nootNootController = nootNootController

        return mainController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nootNootController.playNootNoot()

        configureGifImageView()
    }

    private func configureGifImageView() {
        gifImageView.canDrawSubviewsIntoLayer = true
        gifImageView.imageScaling = .scaleProportionallyDown
        gifImageView.animates = true
        gifImageView.image = NSImage(named: "noot")
    }
}
