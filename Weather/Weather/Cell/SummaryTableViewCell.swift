//
//  SummaryTableViewCell.swift
//  Weather
//
//  Created by 최정민 on 2021/02/19.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    
    static let identifier = "SummaryTableViewCell"
    
    @IBOutlet weak var weatherimageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var minMaxLabel: UILabel!
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
