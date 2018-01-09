//
//  Source.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation


struct Source {
    let id: String
    let name: String
    let description: String
    let category: String
    let url: String
    
    init(id: String, name: String, description: String, category: String, url: String){
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.url = url
    }
}
