//
//  InfoController.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/14/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Foundation

class InfoController{
    
    let baseURL = URL(string: "https://macos-b94ff.firebaseio.com/API")
    
    
    func post(key: String, value: String){
        let info = Info(key: key, value: value, uuid: UUID())
        guard let data = info.data else { return }
        guard let url = baseURL?.appendingPathComponent(info.uuid.uuidString).appendingPathExtension("json") else { return }
        
        NetworkController.performRequest(for: url, httpMethod: .put, urlParameters: nil, body: data) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
