//
//  SourcesDataStore.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 10/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation

class SourcesDataStore {
    var sources: [Source]
    var selectedSources: [String]
    
    init(sources: [Source], selectedSources: [String]) {
        self.sources = sources
        self.selectedSources = selectedSources
    }
    
}
