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
    @IBOutlet weak var quoteTextLabel: NSTextField!
    @IBOutlet weak var quoteAuthorLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        NootNootManager.shared.playNootNoot()

        self.configureUI()
    }

    private func configureUI() {
        configureGifImageView()
        configureRandomQuote()
    }

    private func configureRandomQuote() {
        guard let quote = QuoteManager.shared.getRandomQuote() else {
            return
        }

        quoteTextLabel.stringValue = quote.text
        quoteAuthorLabel.stringValue = quote.author
    }

    private func configureGifImageView() {
        gifImageView.canDrawSubviewsIntoLayer = true
        gifImageView.imageScaling = .scaleProportionallyDown
        gifImageView.animates = true
        gifImageView.image = NSImage(named: "noot")
    }

    @IBAction func reload(_ sender: Any) {
        NootNootManager.shared.playNootNoot()
        configureRandomQuote()
    }
}
