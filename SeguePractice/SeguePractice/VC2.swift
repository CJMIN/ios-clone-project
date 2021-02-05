//
//  VC2.swift
//  SeguePractice
//
//  Created by 최정민 on 2021/02/06.
//

import Foundation

import UIKit

class VC2: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    var num:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Second : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second : viewWillAppear")
        label.text=num
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Second : viewDidAppear")
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Second : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Second : viewDidDisappear")
    }


}
