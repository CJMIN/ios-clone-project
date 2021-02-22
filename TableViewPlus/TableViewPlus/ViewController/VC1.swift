import UIKit

class VC1: UIViewController {
    
    
    
    var ContactInforArray:[String] = ["CJM"]
    
    var idx:Int = 0
    
    
    @IBAction func PlusButton(_ sender: Any) {
        if self.ContactInforArray.contains("연락처를 입력하세요.") {
            return
        }
        self.ContactInforArray.append("연락처를 입력하세요.")
        self.tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        let tableView_Nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        tableView.register(tableView_Nib, forCellReuseIdentifier: "VC1")
        
        
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





extension VC1: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ContactInforArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VC1") as? TableViewCell else  {
            return UITableViewCell()
        }
        
        cell.name.text = self.ContactInforArray[indexPath.row]
        
       return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            ContactInforArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.idx = indexPath.row
        self.performSegue(withIdentifier: "VC1toVC2", sender: nil)
    }
    
    
       
}






extension VC1: UITableViewDelegate{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination
        
        guard let VC2 = dest as? VC2 else{
            return
        }
        
        VC2.idx = self.idx
        print("self idx : ",self.idx)
        print("VC2 idx : ",VC2.idx)
        
        
        
        
    }
    
}
