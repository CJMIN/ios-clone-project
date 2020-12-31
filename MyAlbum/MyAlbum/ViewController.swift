//
//  ViewController.swift
//  MyAlbum
//
//  Created by 최정민 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func chellenge(_ sender: Any) {
        
        let message = "가격은 \(currentValue)입니다."
        
        let alert = UIAlertController(title:"Hello",message: message,preferredStyle:.alert)
        let action = UIAlertAction(title:"OK",style: .default,handler: {action in self.refresh()})
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
        
    }
    
    func refresh(){
        
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        priceLabel.text="$\(currentValue)"
        
    }
    
}

