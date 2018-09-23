//
//  GithubRestService.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/21/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import RxSwift

enum DecodeError : Error {
    case parseJsonError()
}

class GithubRestService {
    
    private let baseUrl = "https://api.github.com/"
    
    private let apiClient: ApiClient
    
    init() {
        let url = NSURL(fileURLWithPath: baseUrl)
        apiClient = ApiClient(baseURL: url)
    }
    
    func getRepositories(by name: String) -> Observable<[SearchResultItemModel]> {
        let urlPreffix = "search/users?q=\(name)"
        return apiClient.request(url: urlPreffix, method: .GET).map(decode)
    }
    
    private func decode(data: Data) throws -> [SearchResultItemModel] {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) else {
            throw DecodeError.parseJsonError()
        }
        
        guard let dictionary = jsonObject as? JsonDictionary else {
            return []
        }
        
        guard let searchItems = dictionary["items"] as? [JsonDictionary] else {
            return []
        }
        
        return searchItems.map(SearchResultItemModel.init)
    }
}
