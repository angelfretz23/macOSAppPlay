//
//  Song.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/18/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Foundation

class Song{
    let artistName: String
    let releasedDate: String?
    let relevantLyrics: String
    let songName: String
    let songStory: String?
    let writersName: String?
    let youtubeVideoId: String
    let hashTags: String?
    
    private let kArtistName = "artist_name"
    private let kReleasedDate = "release_date"
    private let kRelevantLyrics = "relevant_lyrics"
    private let kSongName = "song_name"
    private let kSongStory = "song_story"
    private let kYoutubeVideoID = "youtube_video_id"
    private let kWritersName = "writers_name"
    private let kHashTags = "hastags"
    
    
    init(artistName: String, releasedDate: String?, relevantLyrics: String, songName: String, songStory: String?, writersName: String?, youtubeVideoId: String, hashTags: String?){
        self.artistName = artistName
        self.releasedDate = releasedDate
        self.relevantLyrics = relevantLyrics
        self.songName = songName
        self.songStory = songStory
        self.writersName = writersName
        self.youtubeVideoId = youtubeVideoId
        self.hashTags = hashTags
    }
    
    var dictionaryRepresentation: [String : Any]{
        var dictionary: [String: Any] = [kArtistName: self.artistName, kRelevantLyrics: self.relevantLyrics, kSongName: self.songName, kYoutubeVideoID: self.youtubeVideoId]
        
        if let releasedDate = self.releasedDate{
            dictionary[kReleasedDate] = releasedDate
        }
        
        if let songStory = self.songStory{
            dictionary[kSongStory] = songStory
        }
        
        if let writersName = self.writersName{
            dictionary[kWritersName] = writersName
        }
        
        if let hashTags = self.hashTags {
            dictionary[kHashTags] = hashTags
        }
        
        return dictionary
    }
    
    var jsonData: Data?{
        return (try? JSONSerialization.data(withJSONObject: self.dictionaryRepresentation, options: .prettyPrinted))
    }
}
