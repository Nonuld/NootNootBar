//
//  TouchBarController.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 19/12/2019.
//  Copyright © 2019 Arnaud Le Bourblanc. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarItem.Identifier {
    static let nootNoot = NSTouchBarItem.Identifier("com.alb.NootNootBar")
}

class TouchBarController {

    private lazy var item: NSCustomTouchBarItem = {
        let i = NSCustomTouchBarItem(identifier: .nootNoot)
        return i
    }()

    private lazy var button: NSButton = {
        NSButton(image: NSImage(named: "BarIcon")!, target: self, action: #selector(toggleNootNoot))
    }()

    private var nootNootController: NootNootController!

    static func instantiate(with nootNootController: NootNootController) -> TouchBarController {
        let touchBarController = TouchBarController()
        touchBarController.nootNootController = nootNootController
        return touchBarController
    }

    func configureUI() {
        item.view = button

        DFRSystemModalShowsCloseBoxWhenFrontMost(false)

        NSTouchBarItem.addSystemTrayItem(item)

        DFRElementSetControlStripPresenceForIdentifier(.nootNoot, true)
    }

    @objc func toggleNootNoot() {
        nootNootController.playNootNoot()
    }
    
}
