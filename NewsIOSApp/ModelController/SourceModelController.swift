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
    
    let dataStore: SourcesDataStore
    
    init() {
        self.dataStore = SourcesDataStore(sources: [], selectedSources: [])
    }
    
    func getSources(completionHandler: @escaping () -> Void ) {
        
        if dataStore.sources.count > 0 {
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
                let sourcesDto: [SourceDto] = sourceResponseDto.sources ?? []
                self.dataStore.selectedSources = sourceResponseDto.selectedSources ?? []
                self.dataStore.sources = sourcesDto.map({ (sourceDto) -> Source in
                    Source(id: sourceDto.id ?? "", name: sourceDto.name ?? "", description: sourceDto.description ?? "", category: sourceDto.category ?? "", url: sourceDto.url ?? "")
                })
                print(self.dataStore.sources)
                completionHandler()
            } catch {
                print("ERROR: Problem decoding json")
            }
            
        }
    }
    
    
    func getSource(index: Int) -> Source {
        return self.dataStore.sources[index]
    }
    
    func getSourceCount() -> Int {
        return self.dataStore.sources.count
    }
    
    func setSelectedSource(selectedId: String) {
        self.dataStore.selectedSources = [selectedId]
    }
    
    func getSelectedSources() -> [String] {
        return self.dataStore.selectedSources
    }
}
