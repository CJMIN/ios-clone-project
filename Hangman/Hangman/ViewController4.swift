//
//  ViewController4.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import Foundation
import UIKit

var current_state : Int = 14
var check_value : Bool = false

class ViewController4: UIViewController {

    
    
    @IBOutlet weak var HangmanImage: UIImageView!
    
    
    @IBOutlet weak var OXImage: UIImageView!
    
    @IBOutlet weak var LabelOfAlphabet: UILabel!
    
//    @IBAction func CheckButton(_ sender: Any) {
//
//        if (Alphabet in dic){
//            OXImage.image=UIImage(named: "O")
//        }else{
//
//        }
//    }
    
    var Alphabet:String = ""
    
    var word_arr_in_VC4 : [String] = ["a"]
    
    var temp_in_VC4 : [String] = []
    
    
    
//
//    var current_state : Int = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Fourth : viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Fourth : viewWillAppear")
        
        LabelOfAlphabet.text=Alphabet
        HangmanImage.image = UIImage(named: String(current_state))
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Fourth : viewDidAppear")
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Fourth : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Fourth : viewDidDisappear")
    }
    
    @IBAction func CheckButton(_ sender: Any) {
        
        check_value=true
        var flag :Bool=true
        
        print(word_arr_in_VC4)
        
        if word_arr_in_VC4.firstIndex(of: Alphabet) == nil{
            flag = false
        }else{
            flag = true
        }
        
        
       
        
        
        if (flag){
            OXImage.image=UIImage(named: "O")
            HangmanImage.image=UIImage(named: String(current_state))
            
        }else{
            OXImage.image=UIImage(named: "X")
            if (current_state>0){
                current_state-=1
            }
            HangmanImage.image=UIImage(named: String(current_state))
        }
    }


}
