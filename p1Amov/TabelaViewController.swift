//
//  TabelaViewController.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 14/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class TabelaViewController: UITableViewController {
    
    var lstListas : [ItemList] = []

    func adiciona(lista: ItemList){
        lstListas.append(lista)
        tableView.reloadData()
        print("Numero de Listas: \(lstListas.count)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func onEdit(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lstListas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinhaLista", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = lstListas[row].nome
        //cell.detailTextLabel?.text = "10"
        
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.*/
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            lstListas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let lista = lstListas[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditarLista") as! ViewController
        
        vc.lista_original = lista
        vc.base = self
        
        navigationController?.show(vc, sender: self)*/
        
        let tvc = storyboard?.instantiateViewController(withIdentifier: "ItemListTableView") as! ItemListTableViewController
        
        tvc.lista_original = lstListas[indexPath.row]
        
        tvc.base = self
        
        navigationController?.show(tvc, sender: self)
        
        
    }

    /*
    // Override to support rearranging the table view.*/
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let row1 = fromIndexPath.row
        let row2 = to.row
        
        let temp = lstListas[row1]
        lstListas[row1] = lstListas[row2]
        lstListas[row2] = temp
        
        tableView.reloadData()    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "segueListaEditor" {
            let vc = segue.destination as! ViewController
            vc.base = self
        }
        
        if (segue.identifier == "segueLista"){
            let tvc = segue.destination as! ItemListTableViewController
            tvc.base = self
        }
    }

}
