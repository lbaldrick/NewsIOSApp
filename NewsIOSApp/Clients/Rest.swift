//
//  Rest.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 29/12/2017.
//  Copyright © 2017 Michael Lee Baldrick. All rights reserved.
//

import Foundation


class Rest {
    
    private static let baseUrl: String = ""
    
    private static func createRequest(urlString: String, method: String) -> URLRequest {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        return request
    }
    
    private static func makeRequest(request: URLRequest, completion: @escaping (Any?) -> Void) ->  URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                completion(nil)
                return
            }
            
            completion(json)
        })
        
        return task;
    }
    
    static func get(url: String, completion: @escaping (Any?) -> Void) {
        let request = createRequest(urlString: url, method: "GET")
        let task = makeRequest(request: request, completion: completion)
        
        task.resume();
    }

}
