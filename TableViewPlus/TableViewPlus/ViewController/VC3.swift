import UIKit

class VC3: UIViewController {
    
    
    var Title:String = ""
    
    var Content:String = ""
    
    var idx:Int = 0
    
    var idxpath:Int = 0
    
    
    @IBOutlet weak var VC3Title: UILabel!
    @IBOutlet weak var VC3Content: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func push(_ sender: Any) {
        
        if let value = titleValue.text{
            ContactTitleArray2[idx][idxpath] = titleValue.text!
        }else{
            ContactTitleArray2[idx][idxpath] = ""
        }
        
        if let value = contentValue.text{
            ContactContentArray2[idx][idxpath] = contentValue.text!
        }else{
            ContactContentArray2[idx][idxpath] = ""
        }
        
    }
    @IBOutlet weak var contentValue: UITextField!
    @IBOutlet weak var titleValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
        
        VC3Title.text = Title
        VC3Content.text = Content
    
        
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

