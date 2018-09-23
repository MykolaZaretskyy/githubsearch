//
//  ApiClient.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/21/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import RxSwift

enum ApiClientError: Error {
    case BadStatus(statusCode: Int)
    case Other(error: Error)
}

final class ApiClient {
    
    enum Method: String {
        case GET = "GET"
    }
    
    private let baseURL: NSURL
    private let session: URLSession
    
    init(baseURL: NSURL, configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.baseURL = baseURL
        self.session = URLSession(configuration: configuration)
    }
    
    private func makeRequest(urlPreffix: String, method: Method) -> URLRequest {
        var url: URL?
        var query: String?
        
        if urlPreffix.contains("?") {
            let parts = urlPreffix.split(separator: "?")
            let url_part = String(parts[0])
            query = String(parts[1])
            url = baseURL.appendingPathComponent(url_part)
        } else {
            url = baseURL.appendingPathComponent(urlPreffix)
        }
        
        guard let components = NSURLComponents(url: url!, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components from \(url!)")
        }
        
        if let query = query {
            components.query = query
        }
        
        guard let finalUrl = components.url else {
            fatalError("Unable to retrieve final URL")
        }
        
        let request = NSMutableURLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        
        return request as URLRequest
    }
    
    func request(url: String, method: Method) -> Observable<Data> {
        let urlRequest = makeRequest(urlPreffix: url, method: method)
        
        return Observable.create { observer in
            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    observer.onError(ApiClientError.Other(error: error))
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        fatalError("Couldn't get HTTP response")
                    }
                    
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        observer.onNext(data! as Data)
                        observer.onCompleted()
                    } else {
                        observer.onError(ApiClientError.BadStatus(statusCode: httpResponse.statusCode))
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
        }
    }
    
    }
}
