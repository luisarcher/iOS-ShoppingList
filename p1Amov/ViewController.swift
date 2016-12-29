//
//  ViewController.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/11/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var edtEmail: UITextField!
    @IBOutlet weak var edtNome: UITextField!
    
    var base : TabelaViewController?
    var cont_original : Contacto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let contacto = cont_original {
            edtNome.text = contacto.nome
            edtEmail.text = contacto.email
        }
        
        edtNome.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSave(_ sender: Any) {
        guard let nome = edtNome.text else {
            return
        }
        guard let email = edtEmail.text else {
            return
        }
        
        if nome.characters.count < 1 {
            edtNome.becomeFirstResponder()
            return
        }
        
        if email.characters.count < 1 {
            edtEmail.becomeFirstResponder()
            return
        }
        
        if cont_original == nil {
            let contacto = Contacto(nome:nome, email: email)
        
        	base?.adiciona(contacto: contacto)
        } else {
            cont_original!.nome = nome
            cont_original!.email = email
            base?.tableView.reloadData()   //"o mais correcto era fazer uma funç\ao e fazer o reload data la dentro
        }
        
        
        navigationController!.popViewController(animated: true)
        
    }
}

