//
//  TableViewController.swift
//  MyAlbum
//
//  Created by 최정민 on 2021/03/15.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    let data = ["Apple","Oranges","Bananas","Pears","Plums"]
    var filterData: [String]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filterData = data
         
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = filterData[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterData = []
        
        if searchText == "" {
            filterData = data
        }
        
        for fruit in data {
            if fruit.lowercased().contains(searchText.lowercased()){
                filterData.append(fruit)
            }
        }
        
        self.tableView.reloadData()
    }
}
