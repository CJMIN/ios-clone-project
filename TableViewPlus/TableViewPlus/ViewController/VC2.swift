import UIKit

class VC2: UIViewController {
    
    
    
    @IBAction func PlusPropertyButton(_ sender: Any) {
        
    }
    
    
    @IBAction func EdditButton(_ sender: Any) {
        
    }
    
    var V2ContactInforArray2:[[String]] = [[]]
    
    var V2ContactInforArray:[String] = []
    
    var idx:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if V2ContactInforArray2.count == idx{
            V2ContactInforArray2.append([])
        }
        V2ContactInforArray=V2ContactInforArray2[idx]
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



extension VC2: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return V2ContactInforArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VC1") as? TableViewCell else  {
            return UITableViewCell()
        }
        
        cell.name.text = self.V2ContactInforArray[indexPath.row]
        
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            V2ContactInforArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "VC1toVC2", sender: nil)
    }
    
    
       
}


extension VC2: UITableViewDelegate{
    
   
    
}
