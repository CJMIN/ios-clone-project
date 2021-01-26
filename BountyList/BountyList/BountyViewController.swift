//
//  BountyViewController.swift
//  BountyList
//
//  Created by 최정민 on 2021/01/04.
//

import UIKit

class BountyViewController: UIViewController,UITableViewDataSource,UITabBarDelegate {
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//
//        return cell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
            
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgview.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
             
            return cell
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    //UITableViewDelegate
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("--->\(indexPath.row)")
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
}


class ListCell : UITableViewCell{
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
}
