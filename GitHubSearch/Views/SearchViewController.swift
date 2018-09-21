//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/17/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    private let searchController = UISearchController(searchResultsController: nil)
    var disposeBag = DisposeBag()
    
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        bind()
    }
    
    func bind() {
        viewModel.bindButtonTap(observable: nextButton.rx.tap.asObservable())
//        viewModel.buttonTitle.bind(to: nextButton.rx.title(for: UIControlState.normal)).disposed(by: disposeBag)
//        nextButton.rx.tap.asObservable().bind(onNext: { [weak self] data in
//            self?.viewModel.count.value += 1 }).disposed(by: disposeBag)
    }
    
    func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = true
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}

