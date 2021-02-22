//
//  TableViewCellOutline.swift
//  TableViewPlus
//
//  Created by 최정민 on 2021/02/22.
//

import UIKit

class TableViewCellOutline: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var Content: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
