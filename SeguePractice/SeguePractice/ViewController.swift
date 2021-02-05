//
//  ViewController.swift
//  SeguePractice
//
//  Created by 최정민 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var TextFieldOfVC1: UITextField!
    
    
    
    @IBAction func onPerformSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "VC1", sender:self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("@ prepare")
        let dest = segue.destination
        
        guard let rvc = dest as? VC2 else{
            return
        }
        
        print("@ \(rvc.num)")
        
        guard self.TextFieldOfVC1.text != nil else {
            return
        }
        rvc.num=self.TextFieldOfVC1.text!
        
        
        
        print("@ \(rvc.num)")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

