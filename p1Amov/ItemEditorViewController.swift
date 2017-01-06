//
//  ItemEditorViewController.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class ItemEditorViewController: UIViewController {
    
    var base : ItemListTableViewController?
    var item_original : Item?

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtQuantidade: UITextField!
    @IBOutlet weak var txtUnidade: UITextField!
    @IBOutlet weak var txtPreco: UITextField!
    @IBOutlet weak var txtObs: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item_original {
            //insere os valores nas textbox
            txtNome.text = item.nome
            txtMarca.text = item.marca
            txtQuantidade.text = String(item.quant)
            txtUnidade.text = item.unid
            txtPreco.text = String(describing: item.preco)
            txtObs.text = item.obs
            
        }
        txtNome.becomeFirstResponder()
    }

    @IBAction func onSave(_ sender: Any) {
        
        guard let nome = txtNome.text else { return }
        guard let quantidade = txtQuantidade.text else { return }
        guard let unidade = txtUnidade.text else { return }
        guard let obs = txtObs.text else { return }
        
        if nome.characters.count < 1 {
            txtNome.becomeFirstResponder()
            return
        }
        
        if quantidade.characters.count < 1 {
            txtQuantidade.becomeFirstResponder()
            return
        }
        
        if unidade.characters.count < 1 {
            txtUnidade.becomeFirstResponder()
            return
        }
        
        if obs.characters.count < 1 {
            txtObs.becomeFirstResponder()
            return
        }
        
        let marca = (txtMarca?.text)! + ""
        let preco = (txtPreco?.text)! + ""
        
        
        
        if item_original == nil {
            //init (nome : String, marca : String, quant : Int, unid : float_t, preco : float_t){
            
            let item = Item(nome: nome, marca: marca, quant: Int(quantidade)!, unid:unidade, preco: Float(preco)!, obs : obs)
            
            base?.adiciona(prod: item)
            
        } else {
            //Modo de edição
            item_original?.nome = nome
            item_original?.marca = marca
            item_original?.quant = Int(quantidade)!
            item_original?.unid = unidade
            item_original?.preco = Float(preco)!
            item_original?.obs = obs
            
            
            base?.tableView.reloadData()
        }
        
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
