//
//  Resource.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/18/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation

enum Method: String {
    case GET = "GET"
}

protocol Resource {
    var method: Method { get }
    var path: String { get }
    var parameters: [String: String]{ get }
}

extension Resource {
    
    var method: Method {
        return .GET
    }
    
    func requestWithBaseUrl(baseUrl: NSURL) -> NSURLRequest {
        let url = baseUrl.appendingPathComponent(path)
        
        guard let components = NSURLComponents(url: url!, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components from \(url!)")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let finalUrl = components.url else {
            fatalError("Unable to retrieve final URL")
        }
        
        let request = NSMutableURLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        
        return request
    }
}
