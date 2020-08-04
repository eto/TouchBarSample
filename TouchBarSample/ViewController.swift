//
//  ViewController.swift
//  TouchBarSample
//
//  Created by Koichiro Eto on 2020/08/05.
//  Copyright © 2020 Koichiro Eto. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    override func makeTouchBar() -> NSTouchBar? {
        let touchBarIdenitifier = NSTouchBar.CustomizationIdentifier("com.eto.TestToolBar")
        let touchBarLabelIdentifier = NSTouchBarItem.Identifier(rawValue: "com.eto.TestToolBar.label")
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = touchBarIdenitifier
        touchBar.defaultItemIdentifiers = [touchBarLabelIdentifier, .fixedSpaceLarge, .otherItemsProxy]
        touchBar.customizationAllowedItemIdentifiers = [touchBarLabelIdentifier]
        return touchBar
    }
}

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var representedObject: Any? {
        didSet {
        }
    }
}

extension WindowController: NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier.rawValue == "com.eto.TestToolBar.label" {
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = "Label"
            let label = NSTextField.init(labelWithString: "⭐️")
            custom.view = label
            return custom
        }
        return nil
    }
}
