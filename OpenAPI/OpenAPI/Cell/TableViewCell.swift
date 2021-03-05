//
//  TableViewCell.swift
//  OpenAPI
//
//  Created by 최정민 on 2021/03/03.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var temperture: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTemperture: UILabel!
    @IBOutlet weak var minTemperture: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
