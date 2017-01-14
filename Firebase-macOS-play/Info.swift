//
//  Info.swift
//  Firebase-macOS-play
//
//  Created by Angel Contreras on 1/14/17.
//  Copyright © 2017 Angel Contreras. All rights reserved.
//

import Foundation

struct Info{
    let key: String
    let value: String
    let uuid: UUID
    
    var data: Data?{
        return (try? JSONSerialization.data(withJSONObject: [self.key: self.value], options: .prettyPrinted))
    }
}
