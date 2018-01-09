//
//  SourceDto.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation

struct LogoUrls: Codable  {
    var small: String?
    var medium: String?
    var large: String?
    
    init(small: String?, medium: String?, large: String?) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

struct SourceDto: Codable  {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
    var urlsToLogos: LogoUrls?
    var sortBysAvailable: [String]?
    
    init(id: String?, name: String?, description: String?, url: String?, category: String?, language: String?, country: String?, urlsToLogos: LogoUrls?, sortBysAvailable: [String]?) {
        self.id = id
        self.name = name
        self.description = description
        self.url = url
        self.category = category
        self.country = country
        self.urlsToLogos = urlsToLogos
        self.sortBysAvailable = sortBysAvailable
    }
}
