import UIKit

class VC4: UIViewController {

    
    
    @IBAction func Title(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func Information(_ sender: Any) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


