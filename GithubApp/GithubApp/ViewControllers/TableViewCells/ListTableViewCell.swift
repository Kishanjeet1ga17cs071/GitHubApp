//
//  ListTableViewCell.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var listLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
