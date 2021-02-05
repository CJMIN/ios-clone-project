//
//  ViewController3.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import Foundation
import UIKit

var label_arr:[UILabel]=[]

class ViewController3: UIViewController {
    
    
    var word : String = ""
    var word_arr :[String] = []
    var word_arr_current : [Character] = []
    
    
    
    @IBOutlet weak var a0: UILabel!
    @IBOutlet weak var a1: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var a3: UILabel!
    @IBOutlet weak var a4: UILabel!
    @IBOutlet weak var a5: UILabel!
    @IBOutlet weak var a6: UILabel!
    @IBOutlet weak var a7: UILabel!
    @IBOutlet weak var a8: UILabel!
    @IBOutlet weak var a9: UILabel!
    @IBOutlet weak var a10: UILabel!
    @IBOutlet weak var a11: UILabel!
    @IBOutlet weak var a12: UILabel!
    @IBOutlet weak var a13: UILabel!
    @IBOutlet weak var a14: UILabel!
    @IBOutlet weak var a15: UILabel!
    @IBOutlet weak var a16: UILabel!
    @IBOutlet weak var a17: UILabel!
    @IBOutlet weak var a18: UILabel!
    @IBOutlet weak var a19: UILabel!
    @IBOutlet weak var a20: UILabel!
    @IBOutlet weak var a21: UILabel!
    @IBOutlet weak var a22: UILabel!
    @IBOutlet weak var a23: UILabel!
    @IBOutlet weak var a24: UILabel!
    @IBOutlet weak var a25: UILabel!
    @IBOutlet weak var a26: UILabel!
    @IBOutlet weak var a27: UILabel!
    @IBOutlet weak var a28: UILabel!
    @IBOutlet weak var a29: UILabel!
    @IBOutlet weak var a30: UILabel!
    @IBOutlet weak var a31: UILabel!
    @IBOutlet weak var a32: UILabel!
    @IBOutlet weak var a33: UILabel!
    @IBOutlet weak var a34: UILabel!
    @IBOutlet weak var a35: UILabel!
    @IBOutlet weak var a36: UILabel!
    @IBOutlet weak var a37: UILabel!
    @IBOutlet weak var a38: UILabel!
    @IBOutlet weak var a39: UILabel!
    @IBOutlet weak var a40: UILabel!
    @IBOutlet weak var a41: UILabel!
    @IBOutlet weak var a42: UILabel!
    @IBOutlet weak var a43: UILabel!
    @IBOutlet weak var a44: UILabel!
    @IBOutlet weak var a45: UILabel!
    @IBOutlet weak var a46: UILabel!
    @IBOutlet weak var a47: UILabel!
 
    
    
    
    @IBOutlet weak var TextFieldOfVC3: UITextField!
    
    
    @IBAction func SendAlphabet(_ sender: Any) {
        
        self.performSegue(withIdentifier: "VC3ToVC4", sender:self)
        
    }
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Thrid : viewDidLoad")
        
        
        label_arr=[a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a46,a47]
        
        for i in word{
            word_arr.append(String(i))
            word_arr_current.append("_")
        }
            
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Thrid : viewWillAppear")
        
        
        let NumOfCount :Int = word_arr.count
        
        for i in 0...(NumOfCount-1){
            label_arr[i].text=String(word_arr_current[i])
        }
        
        for i in NumOfCount...47{
            label_arr[i].text=""
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Thrid : viewDidAppear")
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Thrid : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Thrid : viewDidDisappear")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("@ prepare")
        let dest = segue.destination
        
        guard let VC4 = dest as? ViewController4 else{
            return
        }
        
        print("@ \(VC4.Alphabet)")
        
        
        guard self.TextFieldOfVC3.text != nil else {
            return
        }

        
        VC4.Alphabet=self.TextFieldOfVC3.text!
        
        VC4.word_arr=word_arr
        
//        VC4.HangmanImage.image=UIImage(named: String(current_state))
        
        
        print("@ \(VC4.Alphabet)")
        
    }

}
