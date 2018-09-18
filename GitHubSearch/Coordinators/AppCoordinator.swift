//
//  AppCoordinator.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/17/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow?
    
    private var rootViewController = UINavigationController()
    
    private var searchCoordinator: SearchCoordinator
    
    init(window: UIWindow?) {
        self.window = window
        searchCoordinator = SearchCoordinator(presenter: rootViewController)
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        searchCoordinator.start()
        addChildCoordinator(searchCoordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
}
