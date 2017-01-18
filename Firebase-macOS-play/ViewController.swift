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
    @IBOutlet weak var bookComboBox: NSComboBox!
    @IBOutlet weak var chapterComboBox: NSComboBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfChaptersAndBook.forEach { (dictionary) in
            bookComboBox.addItem(withObjectValue: dictionary.first?.key ?? "") //Fill the combo box with book names
        }
        bookComboBox.delegate = self
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

extension ViewController: NSComboBoxDelegate{
    func comboBoxSelectionDidChange(_ notification: Notification) {
        chapterComboBox.removeAllItems()
        chapterComboBox.stringValue = ""
        let bookName = self.bookComboBox.objectValueOfSelectedItem as! String
        let numberOfChapters = dictionaryOfChaptersAndBook[bookName]!
        for x in 1...numberOfChapters{
            chapterComboBox.addItem(withObjectValue: "Chapter \(x)")
        }
    }
}

