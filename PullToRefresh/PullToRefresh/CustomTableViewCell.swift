//
//  CustomTableViewCell.swift
//  PullToRefresh
//
//  Created by 서은수 on 2022/05/11.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    // MARK: - override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
