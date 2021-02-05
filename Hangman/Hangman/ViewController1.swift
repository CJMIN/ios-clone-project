//
//  ViewController1.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import Foundation
import UIKit

class ViewController1: UIViewController {

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
        
        var popUpWindow: PopUpWindow!
        popUpWindow = PopUpWindow(title: "행맨이를 구할 수 있겠어요?", text: "사람 살려~~~날 매달지마~~", buttontext: "맞추면 구할 수 있어요!")
        self.present(popUpWindow, animated: true, completion: nil)
        
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
    }


}
