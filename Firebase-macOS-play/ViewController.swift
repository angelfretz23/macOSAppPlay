//
//  ViewController.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/14/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var bookComboBox: NSComboBox!
    @IBOutlet weak var chapterComboBox: NSComboBox!
    @IBOutlet weak var verseTextField: NSTextField!
    @IBOutlet weak var mediaTypeComboType: NSComboBox!
    @IBOutlet weak var baseURLTextField: NSTextField!
    @IBOutlet weak var outerHashTagsTextField: NSTextField!
    @IBOutlet weak var artistNameTextField: NSTextField!
    @IBOutlet weak var songNameTextField: NSTextField!
    @IBOutlet weak var relevantLyricsTextField: NSTextField!
    @IBOutlet weak var youtubeIDTextField: NSTextField!
    @IBOutlet weak var releasedDateTextField: NSTextField!
    @IBOutlet weak var songStoryTextField: NSTextField!
    @IBOutlet weak var writersNameTextField: NSTextField!
    @IBOutlet weak var innerHashTagsTextField: NSTextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfChaptersAndBook.forEach { (dictionary) in
            bookComboBox.addItem(withObjectValue: dictionary.first?.key ?? "") //Fill the combo box with book names
        }
        bookComboBox.delegate = self
        mediaTypeComboType.selectItem(at: 0)
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func pushToFirbaseButtonPressed(_ sender: Any) {
        
        let postController = PostController(urlString: baseURLTextField.stringValue)
        let book = bookComboBox.objectValueOfSelectedItem as! String
        let mediaType = mediaTypeComboType.objectValueOfSelectedItem as! String
        let chapter = chapterComboBox.objectValueOfSelectedItem as! String
        let verse = verseTextField.stringValue
        
        if outerHashTagsTextField.stringValue != "" {
            postController?.post(dictionary: ["hashtags": outerHashTagsTextField.stringValue],  mediaType: mediaType, book: book, chapter: chapter, verse: verse, songName: nil)
        }
        
        let artistName = artistNameTextField.stringValue
        let songName = songNameTextField.stringValue
        let relevantLyrics = relevantLyricsTextField.stringValue
        let youtubeVideoID = youtubeIDTextField.stringValue
        let releasedDate: String? = (releasedDateTextField.stringValue == "") ? (nil) : (releasedDateTextField.stringValue)
        let songStory: String? = songStoryTextField.stringValue == "" ? nil : songStoryTextField.stringValue
        let writersName: String? = writersNameTextField.stringValue == "" ? nil : writersNameTextField.stringValue
        let innerHashtags: String? = innerHashTagsTextField.stringValue == "" ? nil : innerHashTagsTextField.stringValue
        
        let song = Song(artistName: artistName, releasedDate: releasedDate, relevantLyrics: relevantLyrics, songName: songName, songStory: songStory, writersName: writersName, youtubeVideoId: youtubeVideoID, hashTags: innerHashtags)
        
        postController?.post(dictionary: song.dictionaryRepresentation, mediaType: mediaType, book: book, chapter: chapter, verse: verse, songName: songName)
        
    }
    @IBAction func clearButtonPressed(_ sender: Any) {
        resetFields()
    }
    
    func resetFields(){
        bookComboBox.stringValue = ""
        chapterComboBox.stringValue = ""
        verseTextField.stringValue = ""
        outerHashTagsTextField.stringValue = ""
        artistNameTextField.stringValue = ""
        songNameTextField.stringValue = ""
        relevantLyricsTextField.stringValue = ""
        youtubeIDTextField.stringValue = ""
        releasedDateTextField.stringValue = ""
        writersNameTextField.stringValue = ""
        songStoryTextField.stringValue = ""
        innerHashTagsTextField.stringValue = ""
    }

}

//When Book is select add the number of chapters in the chapter combo box
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




