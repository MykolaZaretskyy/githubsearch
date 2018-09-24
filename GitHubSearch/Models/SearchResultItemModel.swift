//
//  SearchItemModel.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/21/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation

struct SearchResultItemModel : JsonDecodable {
    
    init?(dictionary: JsonDictionary) {
        self.login = dictionary["login"] as? String ?? ""
        self.avatarUrl = dictionary["avatar_url"] as? String ?? ""
        self.html_url = dictionary["html_url"] as? String ?? ""
        self.repositoriesUrl = dictionary["repos_url"] as? String ?? ""
    }
    
    let login: String
    let avatarUrl: String
    let html_url: String
    let repositoriesUrl: String
}
