//
//  ArticlesResponseDto.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 07/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation

struct ArticlesResponseDto: Codable {
    var status: String?
    var source: String?
    var sortBy: String?
    var articles: [ArticleDto]?
    
    init(status: String?, source: String?, sortBy: String?, articles: [ArticleDto]?) {
        self.status = status
        self.source = source
        self.sortBy = sortBy
        self.articles = articles
    }
    
}
