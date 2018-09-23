//
//  JsonDecodable.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/21/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation

typealias JsonDictionary = [String: AnyObject]

protocol JsonDecodable {
    init(dictionary: JsonDictionary)
}
