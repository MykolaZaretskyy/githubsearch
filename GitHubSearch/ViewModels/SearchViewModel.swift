//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/18/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    
    var githubService = GithubRestService()
    
    var searchText = Variable("")
    
    var searchItems: Driver<[SearchResultItemModel]> {
        return searchText.asObservable()
        .throttle(0.3, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .filter({s in !s.isEmpty})
        .flatMapFirst(githubService.getRepositories)
        .asDriver(onErrorJustReturn: [])
    }

//    func bindButtonTap(observable: Observable<Void>) {
//        observable.bind {
//            self.githubService.getRepositories(by: "mykola").bind(onNext: { items in self.items = items })
//        }
//    }
    
}
