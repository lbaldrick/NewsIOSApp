//
//  Article.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 01/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation


class Article {
    
    let author: String
    let description: String
    let publishedAt: String
    let title: String
    let url: String
    let urlToImage: String
    
    init(author: String, description: String, publishedAt: String, title: String, url: String, urlToImage: String) {
        self.author = author
        self.description = description
        self.publishedAt = publishedAt
        self.title = title
        self.url = url
        self.urlToImage = urlToImage
    }
}
