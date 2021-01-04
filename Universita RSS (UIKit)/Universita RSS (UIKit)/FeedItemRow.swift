//
//  FeedItemRow.swift
//  Universita RSS (UIKit)
//
//  Created by Loris Plasson Simoni on 04/01/2021.
//

import UIKit

class FeedItemRow: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
