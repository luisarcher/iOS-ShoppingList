//
//  Item.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 29/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit

class Item: NSObject {
    var nome : String
    var marca : String?
    var quant : Int
    var unid : float_t
    var preco : float_t?
    
    init (nome: String, quant : Int, unid : float_t){
        self.nome = nome;
        self.quant = quant;
        self.unid = unid;
    }
    
    init (nome : String, marca : String, quant : Int, unid : float_t, preco : float_t){
        self.nome = nome;
        self.quant = quant;
        self.unid = unid;
        self.marca = marca;
        self.preco = preco;
    }

}
