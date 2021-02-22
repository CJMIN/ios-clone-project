import UIKit

var V2ContactTitleArray2:[[String]] = [["Title"]]
var V2ContactContentArray2:[[String]] = [["Content"]]

class VC2: UIViewController {
    
    
    
    @IBAction func PlusPropertyButton(_ sender: Any) {
        
    }
    
    
    @IBAction func EdditButton(_ sender: Any) {
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var V2ContactTitleArray:[String] = []
    
   
    
    var V2ContactContentArray:[String] = []
    
    var idx:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        let tableView_Nib = UINib(nibName: "TableViewCellOutline", bundle: nil)
        
        tableView.register(tableView_Nib, forCellReuseIdentifier: "VC2")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
        
        if V2ContactTitleArray2.count == idx{
            V2ContactTitleArray2.append([])
            V2ContactContentArray2.append([])
        }
        V2ContactTitleArray = V2ContactTitleArray2[idx]
        V2ContactContentArray = V2ContactContentArray2[idx]
        
        print(idx)
        print(V2ContactContentArray)
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
        
        return V2ContactTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VC2") as? TableViewCellOutline else  {
            return UITableViewCell()
        }
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print(indexPath.row)
        print(V2ContactContentArray)
        cell.Title.text = self.V2ContactTitleArray[indexPath.row]
        cell.Content.text = self.V2ContactContentArray[indexPath.row]
        
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            V2ContactTitleArray.remove(at: indexPath.row)
            V2ContactTitleArray2.remove(at: indexPath.row)
            V2ContactContentArray.remove(at: indexPath.row)
            V2ContactContentArray2.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        self.performSegue(withIdentifier: "VC1toVC2", sender: nil)
//    }
    
    
       
}


extension VC2: UITableViewDelegate{
    
   
    
}
