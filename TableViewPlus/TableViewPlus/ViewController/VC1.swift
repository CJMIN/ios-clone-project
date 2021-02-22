import UIKit

class VC1: UIViewController {
    
    
    
    var ContactInforArray:[String] = ["최정민"]
    
    
    @IBAction func PlusButton(_ sender: Any) {
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
        self.performSegue(withIdentifier: "VC5", sender:self)
    }
    
    
       
}






extension VC1: UITableViewDelegate{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
}
