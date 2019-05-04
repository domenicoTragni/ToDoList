//
//  ViewController.swift
//  ToDoList
//
//  Created by Domenico Tragni on 01/05/2019.
//  Copyright © 2019 Domenico Tragni. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray=[Elemento]()
   // var itemArray = ["mangiare","dormire","camminare","saltare","telefonare"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       if let item = defaults.array(forKey: "CreareUnaLista")as?[Elemento]{
        //passa alla costante il valore del nostro "database" come array di stringe e successivamente lo passiamo al nostro array, che verra' caricato con i nuovi valori che non sono stati preinseriti da noi durante la creazione dell'array
            itemArray = item
        }
           let newItem = Elemento()
           newItem.title = "Allenare"
           itemArray.append(newItem)
        
           let newItem1 = Elemento()
           newItem1.title = "Studiare"
           itemArray.append(newItem1)
        
           let newItem2 = Elemento()
           newItem2.title = "Mangiare"
           itemArray.append(newItem2)
    }
    
     // MARK - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        let item = itemArray[indexPath.row]
        
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    // MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        cell?.isSelected = false
        tableView.reloadData()
}
    // MARK - aggiunto nuovo oggetto
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let oggetto = Elemento()
    let alert = UIAlertController(title: "Aggiungi nuovo articolo", message: nil, preferredStyle: .alert)
    let action =  UIAlertAction(title: "Aggiungi", style: .default) { (action) in
        
        // impostiamo codice che gestisce la pressione del bottone aggiungi
        oggetto.title = textField.text!
        self.itemArray.append(oggetto)
        print(oggetto)
        self.defaults.set(self.itemArray, forKey: "CreareUnaLista")
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
