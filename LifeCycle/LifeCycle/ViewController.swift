//
//  ViewController.swift
//  LifeCycle
//
//  Created by 최정민 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func UnwindSegue(_ sender: UIStoryboardSegue) {
        
        print("# Button2")
        
        if let vc2 = sender.source as? ViewController2{
            
            guard let data = vc2.TextField.text else {
                return
            }
            
            print(data)
            self.label.text = data
            
        }else{
            return
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("first : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("first : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first : viewDidAppear")
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("first : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("first : viewDidDisappear")
    }


}

