//
//  ItemEditorViewController.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class ItemEditorViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtQuantidade: UITextField!
    @IBOutlet weak var txtUnidade: UITextField!
    @IBOutlet weak var txtPreco: UITextField!
    @IBOutlet weak var txtObs: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
        
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
