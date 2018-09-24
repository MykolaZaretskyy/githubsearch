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
    
    private let searchController = UISearchController(searchResultsController: nil)
    var disposeBag = DisposeBag()
    
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Current thread \(Thread.current)")
        tableView.register(UINib(nibName: SearchCellView.cellIdentifier, bundle: nil), forCellReuseIdentifier: SearchCellView.cellIdentifier)
        setupSearchController()
        bind()
    }
    
    func bind() {
        searchController.searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.searchItems
            .drive(tableView.rx.items(cellIdentifier: SearchCellView.cellIdentifier, cellType: SearchCellView.self)) { row, data, cell in
                cell.loginLabel.text = data.login
            }
            .disposed(by: disposeBag)
        
        viewModel.searchItems.map { $0.count == 0 }
            .drive(tableView.rx.isHidden)
            .disposed(by: disposeBag)

//        viewModel.bindButtonTap(observable: nextButton.rx.tap.asObservable())
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

