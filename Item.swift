//
//  Item.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 29/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import Foundation

/*extension Int {
    func format(f: String) -> String {
        return String(format: "%d\(f)d", self)
    }
}*/

extension Float {
    func format(f: String) -> String {
        return String(format: "%d\(f)d", self)
    }
}

class Item : NSObject, NSCoding {
    var nome : String = "unknown"
    var marca : String = ""
    var quant : Int = 0
    var unid : String = ""
    var preco : Float = 0.0
    var obs : String = ""
    
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
    
    /* ===== SERIALIZATION ===== */
    
    required init?(coder aDecoder : NSCoder) {
        
        guard let nome = aDecoder.decodeObject(forKey: "nome") as? String else {
            return nil
        }
        self.nome = nome
        
        guard let marca = aDecoder.decodeObject(forKey: "marca") as? String else {
            return nil
        }
        self.marca = marca
        
        self.quant = aDecoder.decodeInteger(forKey: "quant")
        
        guard let unid = aDecoder.decodeObject(forKey: "unid") as? String else {
            return nil
        }
        self.unid = unid
        
        self.preco = aDecoder.decodeObject(forKey: "preco") as! Float
        
        guard let obs = aDecoder.decodeObject(forKey: "obs") as? String else {
            return nil
        }
        self.obs = obs
        
    }    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(marca, forKey: "marca")
        aCoder.encode(quant, forKey: "quant")
        aCoder.encode(unid, forKey: "unid")
        aCoder.encode(preco, forKey: "preco")
        aCoder.encode(obs, forKey: "obs")
    }

    

}
