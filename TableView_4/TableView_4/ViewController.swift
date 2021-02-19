//
//  ViewController.swift
//  TableView_4
//
//  Created by 최정민 on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {
    
    var check_pressed : [Int:Int] = [:]
    
    var Name : [String] = []

    var StateMessage : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Name = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"]
        
        StateMessage = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"]
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        let tableView_Nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        tableView.register(tableView_Nib, forCellReuseIdentifier: "Label2Switch1")
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Label2Switch1") as? TableViewCell else  {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.index = indexPath.row
        
        if check_pressed[indexPath.row]==1{
            cell.isSwitchOn = true
        }else{
            cell.isSwitchOn = false
        }
        
        
        cell.Name.text = self.Name[indexPath.row]
        
        cell.StateMessage.text = self.StateMessage[indexPath.row]
        
        return cell
    }
    
    
}

extension ViewController : CellDelegate{
    
    func CheckIdx(for index: Int, check: Bool) {
        if check{
            check_pressed[index] = 1
        }else{
            check_pressed[index] = 0
        }
    }
}



