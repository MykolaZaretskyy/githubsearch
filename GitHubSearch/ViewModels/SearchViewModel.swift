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
    
    var buttonTitle: Observable<String> {
        return count.asObservable().map{String($0)}
    }
    
}
