//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/18/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel {
    
    var count = Variable<Int>(0)
    var githubService = GithubRestService()
    var items: [SearchResultItemModel]?
    
    var buttonTitle: Observable<String> {
        return count.asObservable().map{String($0)}
    }
    
    func bindButtonTap(observable: Observable<Void>) {
        observable.bind {
            self.githubService.getRepositories(by: "mykola").bind(onNext: { items in self.items = items })
        }
    }
    
}
