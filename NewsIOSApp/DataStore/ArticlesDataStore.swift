//
//  ArticlesDataStore.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 10/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation

class ArticlesDataStore {
    var articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
}
