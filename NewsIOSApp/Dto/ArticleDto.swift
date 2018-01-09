//
//  ArticleDto.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 07/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation


struct ArticleDto: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
    init( author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
