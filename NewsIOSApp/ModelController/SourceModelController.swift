//
//  SourceModelController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation
import UIKit

class SourceModelController {
    
    var sources: [Source]?
    var selectedSources: [String]?
    
    func getSources(completionHandler: @escaping () -> Void ) {
        
        if self.sources != nil {
            completionHandler()
        } else {
            fetchSources(completionHandler: completionHandler)
        }
    }
    
    private func fetchSources(completionHandler: @escaping () -> Void) {
        Rest.get(url: "http://127.0.0.1:3003/news/sources") { (json) in
            guard let jsonData = json as? Data else {
                print("ERROR: Problem converting jsonData to Data")
                return;
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let sourceResponseDto = try jsonDecoder.decode(SourceResponseDto.self, from: jsonData)
                let sourcesDto: [SourceDto]? = sourceResponseDto.sources
                self.selectedSources = sourceResponseDto.selectedSources
                self.sources = sourcesDto?.map({ (sourceDto) -> Source in
                    Source(id: sourceDto.id ?? "", name: sourceDto.name ?? "", description: sourceDto.description ?? "", category: sourceDto.category ?? "", url: sourceDto.url ?? "")
                })
                print(self.sources ?? [])
                completionHandler()
            } catch {
                print("ERROR: Problem decoding json")
            }
            
        }
    }
}
