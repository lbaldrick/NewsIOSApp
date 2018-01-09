//
//  ArticleModelController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 01/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation


class ArticleModelController {
    
    var articles: [Article]?
    
    func getArticles(completionHandler: @escaping ([Article]?) -> Void ) {
        Rest.get(url: "http://127.0.0.1:3003/news/all") { (json) in
            guard let jsonData = json as? Data else {
                print("ERROR: Problem converting jsonData to Data")
                return;
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let articlesResponseDto = try jsonDecoder.decode(ArticlesResponseDto.self, from: jsonData)
                let articlesDto: [ArticleDto]? = articlesResponseDto.articles
                 self.articles = articlesDto?.map({ (articleDto) -> Article in
                    Article(author: articleDto.author ?? "", description: articleDto.description ?? "", publishedAt: articleDto.publishedAt ?? "", title: articleDto.title ?? "", url: articleDto.url ?? "", urlToImage: articleDto.urlToImage ?? "")
                })
                print(self.articles ?? [])
                completionHandler(self.articles)
            } catch {
                print("ERROR: Problem decoding json")
            }
        }
    }
}
