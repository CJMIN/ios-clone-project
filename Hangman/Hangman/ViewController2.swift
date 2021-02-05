//
//  ViewController2.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import Foundation
import UIKit

var fruit:[String]=["apple","banana","grape","kiwi","strawberry","mango","pineapple","plum","orange","lemon"]

class ViewController2: UIViewController {
    
    
    
    @IBAction func PickRandomFruit(_ sender: Any) {
        
        self.performSegue(withIdentifier: "VC2ToVC3", sender:self)
        
    }
    
    var randNum = arc4random_uniform(10)//0~9사이의 난수
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Second : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second : viewWillAppear")
        randNum = arc4random_uniform(10)//0~9사이의 난수

        
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

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("@ prepare")
        let dest = segue.destination
        
        guard let VC3 = dest as? ViewController3 else{
            return
        }
        
        print("@ \(VC3.word)")
        
        
//        guard self.TextFieldOfVC3.text != nil else {
//            return
//        }

        
        VC3.word=fruit[Int(randNum)]
//        VC4.HangmanImage.image=UIImage(named: String(current_state))
        
        
        print("@ \(VC3.word)")
        
    }

}
