//
//  SearchResultItemModel.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/22/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation

struct SearchResultItemModel : JsonDecodable {
    init(dictionary: JsonDictionary) {
        login = dictionary["login"] as? String ?? ""
        avatarUrl = dictionary["avatar_url"] as? String ?? ""
        htmlUrl = dictionary["html_url"] as? String ?? ""
        repositiriesUrl = dictionary["repos_url"] as? String ?? ""
    }
    
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let repositiriesUrl: String
}
