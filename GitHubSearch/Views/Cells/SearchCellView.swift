//
//  SearchCellView.swift
//  GitHubSearch
//
//  Created by Mykola Zaretskyy on 9/24/18.
//  Copyright © 2018 Mykola Zaretskyy. All rights reserved.
//

import UIKit

class SearchCellView: UITableViewCell {
    static let cellIdentifier = "SearchCellView"
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
