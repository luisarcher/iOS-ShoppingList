//
//  Item.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 29/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import Foundation

class Item : NSObject{
    var nome : String
    var marca : String?
    var quant : Int
    var unid : String
    var preco : Float?
    var obs : String
    
    /*init (nome: String, quant : Int, unid : float_t){
        self.nome = nome;
        self.quant = quant;
        self.unid = unid;
    }*/
    
    init (nome : String, marca : String, quant : Int, unid : String, preco : Float, obs: String){
        self.nome = nome;
        self.quant = quant;
        self.unid = unid;
        self.marca = marca;
        self.preco = preco;
        self.obs = obs;
    }
    

}
