//
//  ViewController.swift
//  OpenAPI
//
//  Created by 최정민 on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillDisappear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
    }

}
