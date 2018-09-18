//
//  BaseCoordinator.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/17/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import Foundation

class BaseCoordinator {
    
    private(set) var childCoordinators: [BaseCoordinator] = []
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func addChildCoordinator(_ coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: BaseCoordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}

extension BaseCoordinator: Equatable {
    
    static func == (lhs: BaseCoordinator, rhs: BaseCoordinator) -> Bool {
        return lhs === rhs
    }
    
}
