//
//  ViewController.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/14/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var keyTextField: NSTextField!
    @IBOutlet weak var valueTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func pushToFirbaseButtonPressed(_ sender: Any) {
        let key = keyTextField.stringValue
        let value = valueTextField.stringValue
        
        InfoController().post(key: key, value: value)
        
    }

}

