//
//  ViewController.swift
//  ToDoList
//
//  Created by Domenico Tragni on 01/05/2019.
//  Copyright © 2019 Domenico Tragni. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["mangiare","dormire","camminare","saltare","telefonare"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
     // MARK - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        else{
            cell?.accessoryType = .checkmark
        }
        cell?.isSelected = false
}
    // MARK - aggiunto nuovo oggetto
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
   
    let alert = UIAlertController(title: "Aggiungi nuovo articolo", message: nil, preferredStyle: .alert)
    let action =  UIAlertAction(title: "Aggiungi", style: .default) { (action) in
        // impostiamo codice che gestisce la pressione del bottone aggiungi
        self.itemArray.append(textField.text!)
        print("Aggiunto: \(textField.text!) nell'array")
        self.tableView.reloadData()
    }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Aggiungi elemento"
            textField = alertTextField
           alert.addAction(action)
       self.present(alert, animated: true, completion: nil)
        }
   }
    
}
