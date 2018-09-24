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
    
    var searchText = BehaviorSubject(value: "")
    var isLoading = BehaviorSubject(value: false)
    
    var searchItems: Driver<[SearchResultItemModel]> {
        return searchText.asObservable()
        .throttle(1, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .filter({s in !s.isEmpty})
        .do(onNext: { _ in self.isLoading.onNext(true) })
        .flatMapFirst(githubService.getRepositories)
        .do(onNext: { _ in self.isLoading.onNext(false) })
        .asDriver(onErrorJustReturn: [])
    }
}
