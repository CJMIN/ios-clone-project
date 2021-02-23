import UIKit

var ContactTitleArray2:[[String]] = [["CJM"]]
var ContactContentArray2:[[String]] = [["010 0000 0000"]]

class VC2: UIViewController {
    
    var V2ContactTitleArray:[String] = []
    
    var V2ContactContentArray:[String] = []
    
    var idx:Int = 0
    var idxpath:Int = 0
    
    
    @IBAction func PlusPropertyButton(_ sender: Any) {
        
    }
    
    
    @IBAction func EdditButton(_ sender: Any) {
        
        let num :Int = V2ContactTitleArray.count + 1
        
        self.V2ContactTitleArray.append("Title")
        self.V2ContactContentArray.append("Content")
        ContactContentArray2[self.idx].append("Content")
        ContactTitleArray2[self.idx].append("Title")
        self.tableView.reloadData()
//        self.performSegue(withIdentifier: "VC2toVC3", sender: nil)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    

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
        
        print(idx)
        print(ContactContentArray2)
        print(ContactTitleArray2)
        
        V2ContactTitleArray = ContactTitleArray2[idx]
        V2ContactContentArray = ContactContentArray2[idx]
        
        
        
        self.tableView.reloadData()
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
        print(V2ContactTitleArray)
        cell.Title.text = self.V2ContactTitleArray[indexPath.row]
        cell.Content.text = self.V2ContactContentArray[indexPath.row]
        
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            print(V2ContactTitleArray)
            
            print(indexPath.row)
            
            V2ContactTitleArray.remove(at: indexPath.row)
            ContactTitleArray2[idx].remove(at: indexPath.row)
            V2ContactContentArray.remove(at: indexPath.row)
            ContactContentArray2[idx].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.idxpath = indexPath.row
        self.performSegue(withIdentifier: "VC2toVC3", sender: nil)
    }
    
    
       
}


extension VC2: UITableViewDelegate{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination
        
        guard let VC3 = dest as? VC3 else{
            return
        }
        
        VC3.idx = self.idx
        VC3.idxpath = self.idxpath
        VC3.Content = V2ContactContentArray[idxpath]
        VC3.Title = V2ContactTitleArray[idxpath]
            
//        print("self idx : ",self.idx)
//        print("VC2 idx : ",VC3.idx)
//        
//        
        
        
    }
    
}
