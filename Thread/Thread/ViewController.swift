//
//  ViewController.swift
//  Thread
//
//  Created by 최정민 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    let popUpState : Int = 1
    let popDownState : Int = 2
    let spinState : Int = 3
    let popUpMole = UIImage(named: "1")
    let popDownMole = UIImage(named: "2")
    let spinMole = UIImage(named:"3")
    var stateOfmoles : [[Int]] = [[1,1,1,1],[2,1,2,1],[1,1,1,1],[1,2,1,1],[1,1,1,3],[1,1,1,1]]
    var flagForStart : Bool = false
    var molePressedCount : Int = 0
    let s = DispatchSemaphore(value: 1)
 
    
    
    func changeBackgroundImage(UIbuttonOutlet : UIButton, _ idx : [Int]){
        if flagForStart == false{
            return
        }
        
        print("touch down")
        guard stateOfmoles[idx[0]-1][idx[1]-1] == popUpState else{
//            print(stateOfmoles[idx[0]-1][idx[1]-1])
//            print(popUpState)
            return
        }
        
        stateOfmoles[idx[0]-1][idx[1]-1] = 3
        
        countOfTappingMoles += 1
        UIbuttonOutlet.setBackgroundImage(spinMole, for: UIControl.State.normal)
        
       
        s.wait()
        if timeLeft>0{
            molePressedCount += 1
            print("COUNT : \(molePressedCount)")
        }
        s.signal()
        
        
        
//        usleep(10000)
//        UIbuttonOutlet.setBackgroundImage(popDownMole, for: UIControl.State.normal)
        
    }
    
    
    
    @IBOutlet weak var mole11image: UIButton!
    @IBAction func mole11(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole11image,[1,1])
    }
    
    @IBOutlet weak var mole12image: UIButton!
    @IBAction func mole12(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole12image, [1,2])
        
    }
    
    @IBOutlet weak var mole13image: UIButton!
    @IBAction func mole13(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole13image, [1,3])
    }
    
    @IBOutlet weak var mole14image: UIButton!
    @IBAction func mole14(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole14image, [1,4])
    }
    
    @IBOutlet weak var mole21image: UIButton!
    @IBAction func mole21(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole21image, [2,1])
    }
    
    @IBOutlet weak var mole22image: UIButton!
    @IBAction func mole22(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole22image, [2,2])
    }
    
    @IBOutlet weak var mole23image: UIButton!
    @IBAction func mole23(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole23image, [2,3])
    }
    
    @IBOutlet weak var mole24image: UIButton!
    @IBAction func mole24(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole24image, [2,4])
    }
    
    @IBOutlet weak var mole31image: UIButton!
    @IBAction func mole31(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole31image, [3,1])
    }
    
    @IBOutlet weak var mole32image: UIButton!
    @IBAction func mole32(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole32image, [3,2])
    }
    
    @IBOutlet weak var mole33image: UIButton!
    @IBAction func mole33(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole33image, [3,3])
    }
    
    @IBOutlet weak var mole34image: UIButton!
    @IBAction func mole34(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole34image, [3,4])
    }
    
    @IBOutlet weak var mole41image: UIButton!
    @IBAction func mole41(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole41image, [4,1])
    }
    
    @IBOutlet weak var mole42image: UIButton!
    @IBAction func mole42(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole42image, [4,2])
    }
    
    @IBOutlet weak var mole43image: UIButton!
    @IBAction func mole43(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole43image, [4,3])
    }
    
    @IBOutlet weak var mole44image: UIButton!
    @IBAction func mole44(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole44image, [4,4])
    }
    
    @IBOutlet weak var mole51image: UIButton!
    @IBAction func mole51(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole51image, [5,1])
    }
    
    @IBOutlet weak var mole52image: UIButton!
    @IBAction func mole52(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole52image, [5,2])
    }
    
    @IBOutlet weak var mole53image: UIButton!
    @IBAction func mole53(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole53image, [5,3])
    }
    
    @IBOutlet weak var mole54image: UIButton!
    @IBAction func mole54(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole54image, [5,4])
    }
    
    @IBOutlet weak var mole61image: UIButton!
    @IBAction func mole61(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole61image, [6,1])
    }
    
    @IBOutlet weak var mole62image: UIButton!
    @IBAction func mole62(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole62image, [6,2])
    }
    
    @IBOutlet weak var mole63image: UIButton!
    @IBAction func mole63(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole63image, [6,3])
    }
    
    @IBOutlet weak var mole64image: UIButton!
    @IBAction func mole64(_ sender: Any) {
        changeBackgroundImage(UIbuttonOutlet: mole64image, [6,4])
    }
    
    
    var arrayUIButton : [[UIButton]] = [[UIButton]]()
    
    @IBOutlet weak var timeSecond: UILabel!
    @IBAction func startGame(_ sender: Any) {
        if flagForStart == false{
            flagForStart = true
            print("loglog")
            countOfTappingMoles = 0
            if timeLeft==0{
                timeLeft = 15
            }
            runTimer()
            
        }
    }
    
    func randomPop(index :[Int]){
        var numForStopTime : Int
        
        while timeLeft > 0 {
            
            if stateOfmoles[index[0]][index[1]] != 1 {
                numForStopTime = Int.random(in: 500000..<10000000)
                usleep(useconds_t(numForStopTime))
                if timeLeft==0{
                    flagForStart=false
                    while flagForStart==false{
                        
                    }
                    usleep(useconds_t(numForStopTime))
                    
                }
                DispatchQueue.main.sync {
                    arrayUIButton[index[0]][index[1]].setBackgroundImage(popUpMole, for: UIControl.State.normal)
                    stateOfmoles[index[0]][index[1]] = popUpState
                }
                usleep(1500000)
                DispatchQueue.main.sync {
                    arrayUIButton[index[0]][index[1]].setBackgroundImage(popDownMole, for: UIControl.State.normal)
                    stateOfmoles[index[0]][index[1]] = popDownState
                }
                
            }
            
        }
        
    }
    
    var countOfTappingMoles : Int = 0
    var timeLeft : Int = 15
    var timer : Timer?
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        timeLeft -= 1
        
        timeSecond.text = "\(timeLeft) 초"
        
        if timeLeft==0{
            timer?.invalidate()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("First : viewDidLoad")
        
        arrayUIButton = [[mole11image,mole12image,mole13image,mole14image],[mole21image,mole22image,mole23image,mole24image],[mole31image,mole32image,mole33image,mole34image],[mole41image,mole42image,mole43image,mole44image],[mole51image,mole52image,mole53image,mole54image],[mole61image,mole62image,mole63image,mole64image]]
        
        for i in 0...5{
            for j in 0...3{
                arrayUIButton[i][j].setBackgroundImage(popDownMole, for: UIControl.State.normal)
                stateOfmoles[i][j] = 2
                
            }
        }
        
        timeSecond.text = "\(timeLeft) 초"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
        
     
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidAppear")
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                if self.timeLeft==0{
                    DispatchQueue.main.sync {
                        var popUpWindow: PopUpWindow!
                        popUpWindow = PopUpWindow(title: "Score", text: "\(self.countOfTappingMoles)", buttontext: "확인")
                        self.present(popUpWindow, animated: true, completion: nil)
                        self.timeSecond.text = "\(15) 초"
                    }
                    if self.timeLeft==0{
                        self.flagForStart=false
                        while self.flagForStart==false{
                            
                        }
                        
                    }
                }


            }
        }

        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [0,0] )

          

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [0,1] )

                

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [0,2] )

               

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [0,3] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [1,0] )

              

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [1,1] )


            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [1,2] )


            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [1,3] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [2,0] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [2,1] )

             
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [2,2] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [2,3] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [3,0] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [3,1] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [3,2] )

               
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [3,3] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [4,0] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [4,1] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [4,2] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [4,3] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [5,0] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [5,1] )

            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [5,2] )

               
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                /// busy running until press start button
                while true {
                    if self.flagForStart{
                        break
                    }
                }
                
                self.randomPop( index : [5,3] )

            }
        }
        
        print("======================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
    }
    
    
    
    
    

}

