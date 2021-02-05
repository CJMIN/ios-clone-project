//
//  ViewController2.swift
//  LifeCycle
//
//  Created by 최정민 on 2021/02/04.
//

import Foundation

import UIKit

class ViewController2: UIViewController {
    
    
    
    @IBOutlet weak var TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Second : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second : viewWillAppear")
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
