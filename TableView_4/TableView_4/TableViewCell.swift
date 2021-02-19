//
//  TableViewCell.swift
//  TableView_4
//
//  Created by 최정민 on 2021/02/18.
//

import UIKit
var count_num:Int = 0

protocol CellDelegate {

    func CheckIdx(for index:Int, check:Bool)
}



class TableViewCell: UITableViewCell {
    
    var delegate : CellDelegate?
    var index :Int?
    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var StateMessage: UILabel!
    @IBOutlet weak var SwitchState: UISwitch!
    
    
    @IBAction func SwitchClicked(_ sender: UISwitch) {
        
        print("hello")
        
        print("isOn : \(sender.isOn)")
        
        guard let idx = index else {
            return
        }
        
        print("sender.isOn : \(sender.isOn)")
        
        if sender.isOn{
            delegate?.CheckIdx(for: idx, check: true)
        }else{
            delegate?.CheckIdx(for: idx, check: false)
        }
  

    }
//

    
    
    var isSwitchOn : Bool?{


        didSet {

//            print("isSwitchOn : \(isSwitchOn)")

            if isSwitchOn == true {

                SwitchState.isOn = true

                count_num+=1
//                print("스위치 1  \(count_num)")

            }else{

                SwitchState.isOn = false

                count_num-=1
//                print("스위치 2  \(count_num)")

            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
