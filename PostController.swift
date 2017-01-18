//
//  SongController.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/18/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Foundation

class PostController{
    
    let baseURL: URL?
    
    init?(urlString: String?){
        guard let urlString = urlString else { return nil }
        self.baseURL = URL(string: urlString)
    }
    
    func post(dictionary: [String: Any], mediaType: String, book: String,chapter: String, verse: String, songName: String?){
        var url = baseURL?.appendingPathComponent(book).appendingPathComponent(chapter).appendingPathComponent(verse).appendingPathComponent(mediaType)
        if let songName = songName {
            url?.appendPathComponent(songName)
        }
        
        url?.appendPathExtension("json")
        
        guard let fullURL = url else { return }
        guard let data = (try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)) else { return }
        
        print(fullURL)
        NetworkController.performRequest(for: fullURL, httpMethod: .put, urlParameters: nil, body: data) { (_, error) in
            if error != nil{
                print(error?.localizedDescription)
            }
        }
        
    }
}
