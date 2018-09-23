//
//  SearchCellView.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/23/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import UIKit

class SearchCellView: UITableViewCell {
    static let key = "SearchCellView"
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

}
