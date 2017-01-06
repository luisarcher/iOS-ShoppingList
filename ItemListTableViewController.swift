//
//  ItemListTableViewController.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    
    var base : TabelaViewController?
    var lista_original : ItemList?
    
    func adiciona(prod: Item){
        lista_original?.adicionarItem(item: prod)
        tableView.reloadData()
        print("Numero de produtos: \(lista_original?.getNumProdutos())")
        base?.saveFileData()
    }

    @IBAction func onEdit(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        //print("numero de items nesta lista: " + (lista_original?.items[0].nome)!)
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
        return (lista_original?.items.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinhaItem", for: indexPath)

        let row = indexPath.row
        // Configure the cell...
        
        cell.textLabel?.text = lista_original?.items[row].nome
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = lista_original?.getItem(index: indexPath.row)
        let vc = storyboard?.instantiateViewController(withIdentifier: "ItemEditorView") as! ItemEditorViewController
        
        vc.item_original = item
        vc.base = self
        
        navigationController?.show(vc, sender: self)
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            lista_original?.removerItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "segueItem"){
            let vc = segue.destination as! ItemEditorViewController
            vc.base = self
        }
        
    }

}
