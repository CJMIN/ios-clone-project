//
//  ViewController3.swift
//  Hangman
//
//  Created by 최정민 on 2021/02/05.
//

import Foundation
import UIKit

var label_arr:[UILabel]=[]
var alphabet_label_arr:[String:UILabel]=[:]

var current_alphabet : String=""
var NumOfCount :Int = 0
var TempCountNum :Int = 0

class ViewController3: UIViewController {
    
    
    var word : String = ""
    var word_arr :[String] = []
    var word_arr_current : [String] = []
    var temp : [String] = []
    var idx_arr : [Int] = []
    
    
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
 
    
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var c: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var e: UILabel!
    @IBOutlet weak var f: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var h: UILabel!
    @IBOutlet weak var i: UILabel!
    @IBOutlet weak var j: UILabel!
    @IBOutlet weak var k: UILabel!
    @IBOutlet weak var l: UILabel!
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var n: UILabel!
    @IBOutlet weak var o: UILabel!
    @IBOutlet weak var p: UILabel!
    @IBOutlet weak var q: UILabel!
    @IBOutlet weak var r: UILabel!
    @IBOutlet weak var s: UILabel!
    @IBOutlet weak var t: UILabel!
    @IBOutlet weak var u: UILabel!
    @IBOutlet weak var v: UILabel!
    @IBOutlet weak var w: UILabel!
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    
    
    
    
    
    @IBOutlet weak var TextFieldOfVC3: UITextField!
    
    
    @IBAction func SendAlphabet(_ sender: Any) {
        
        self.performSegue(withIdentifier: "VC3ToVC4", sender:self)
        
        
        
    }
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Thrid : viewDidLoad")
        
        
        label_arr=[a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a46,a47]
        
        alphabet_label_arr=["a":a,"b":b,"c":c,"d":d,"e":e,"f":f,"g":g,"h":h,"i":i,"j":j,"k":k,"l":l,"m":m,"n":n,"o":o,"p":p,"q":q,"r":r,"s":s,"t":t,"u":u,"v":v,"w":w,"x":x,"y":y,"z":z]
        
        for i in word{
            word_arr.append(String(i))
            word_arr_current.append("_")
        }
        temp=word_arr
        print("VC3 : viewDidload \(word_arr)")
        NumOfCount = word_arr.count
        TempCountNum = NumOfCount
            
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Thrid : viewWillAppear")
        
        if check_value{
            print("@ @ @ idx_arr : \(idx_arr)")
            for i in idx_arr{
                print(i)
                word_arr_current[i]=word_arr[i]
                TempCountNum-=1
                
            }
            
            if let alpha_label = alphabet_label_arr[current_alphabet]{
                alpha_label.text=""
            }else{
                
            }
//            alphabet_label_arr[current_alphabet]!.text=""
            idx_arr=[]
            print("@ @ @ check : true \(word_arr_current)")
            
            check_value=false
        }
        
        
//        let NumOfCount :Int = word_arr.count
        
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
        current_alphabet=VC4.Alphabet
        
        VC4.word_arr_in_VC4 = word_arr
        
//        alphabet_label_arr[String(VC4.Alphabet)]!.text=""
        
        while temp.firstIndex(of:VC4.Alphabet) != nil{
            
            print(temp.firstIndex(of:VC4.Alphabet))
            var idx : Int = Int(temp.firstIndex(of:VC4.Alphabet)!)
            idx_arr.append(idx)
//            word_arr_current[idx]=temp[idx]
            temp[idx]="#"
            
        }
        
        print("@ @ @ temp : \(temp)")
        
        print("@ @ @ temp : \(idx_arr)")
        
        
        
        
        
//        VC4.HangmanImage.image=UIImage(named: String(current_state))
        
        
        print("@ \(VC4.Alphabet)")
        
    }

}
