//
//  SearchCoordinator.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/18/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: BaseCoordinator {
    
    private var presenter: UINavigationController
    
    private let storyboard = UIStoryboard(name: "SearchViewController", bundle: nil)
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    override func start() {
        let searchViewController = storyboard.instantiateInitialViewController()!
        presenter.pushViewController(searchViewController, animated: true)
    }
    
    override func finish() {
        
    }
}

