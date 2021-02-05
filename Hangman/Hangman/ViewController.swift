//
//  ViewController.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("First : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidAppear")
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
    }


}

