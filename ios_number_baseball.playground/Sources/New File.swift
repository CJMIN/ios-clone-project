import Foundation

class multiplication_table{

    

    var num : Int = 0

    var return_value : Int = 1

    

    func startGame(){

        

        var count:Int = 0
        
        
        while count<10 {

            count += 1

            print("구구단을 외자 : ", terminator:"")

 

            let input_value = readLine()

 

            guard input_value != "exit" else{

                break

            }

 

            if let value = input_value {

    

                num = Int(value)!

    

            }else{

    

                print("input_value is nil")

    

            }

    

            if num == 1 || num == 0 || num == -1{

        

                print("입력값이 잘못되었습니다. 다시 입력해주세요.")

                continue

        

            }else{

        

                for i in 1...9 {

                    return_value = i*num

                    print("\(num) X \(i) = \(return_value)")

                }

        

            }

    

        }

        

        

    }

    

    

}

 

let instance_1 :multiplication_table = multiplication_table()

 

instance_1.startGame()
