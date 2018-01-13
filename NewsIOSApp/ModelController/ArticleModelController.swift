//
//  ArticleModelController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 01/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation


class ArticleModelController {
    
    let dataStore: ArticlesDataStore
    
    init() {
        self.dataStore = ArticlesDataStore(articles: [])
    }
    
    func getArticles(sourceId: String?, completionHandler: @escaping ([Article]?) -> Void) {
        let url = sourceId != nil ? "http://127.0.0.1:3003/news/filter/\(sourceId!)" : "http://127.0.0.1:3003/news/all"
        
        Rest.get(url: url) { (json) in
            guard let jsonData = json as? Data else {
                print("ERROR: Problem converting jsonData to Data")
                return;
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let articlesResponseDto = try jsonDecoder.decode(ArticlesResponseDto.self, from: jsonData)
                let articlesDto: [ArticleDto] = articlesResponseDto.articles ?? []
                 self.dataStore.articles = articlesDto.map({ (articleDto) -> Article in
                    Article(author: articleDto.author ?? "", description: articleDto.description ?? "", publishedAt: articleDto.publishedAt ?? "", title: articleDto.title ?? "", url: articleDto.url ?? "", urlToImage: articleDto.urlToImage ?? "")
                })
                print(self.dataStore.articles)
                completionHandler(self.dataStore.articles)
            } catch {
                print("ERROR: Problem decoding json")
            }
        }
    }
    
    func getArticle(index: Int) -> Article {
        return self.dataStore.articles[index]
    }
    
    func getArticleCount() -> Int {
        return self.dataStore.articles.count
    }
}
