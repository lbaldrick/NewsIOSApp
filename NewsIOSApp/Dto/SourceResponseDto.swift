//
//  SourceResponseDto.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation

struct SourceResponseDto: Codable  {
    var sources: [SourceDto]?
    var selectedSources: [String]?
    
    init(sources: [SourceDto]?, selectedSources: [String]?) {
        self.sources = sources
        self.selectedSources = selectedSources
    }
}
