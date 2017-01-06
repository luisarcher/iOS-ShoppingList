//
//  ItemList.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import Foundation

class ItemList: NSObject, NSCoding{

    var nome : String
    var items = [Item]()
    
    init(n: String){
        self.nome = n;
        self.items = [];
    }
    
    func adicionarItem(item : Item){
        items.append(item)
    }
    
    func removerItem(index : Int){
        items.remove(at: index)
    }
    
    func getNumProdutos() -> Int {
        return items.count
    }
    
    func getItem(index : Int) -> Item{
        return items[index];
    }
    
    required init?(coder aDecoder : NSCoder) {
        
        guard let nome = aDecoder.decodeObject(forKey: "nome") as? String else {
            return nil
        }
        self.nome = nome
        
        guard let items = aDecoder.decodeObject(forKey: "items") as? [Item] else {
            return nil
        }
        self.items = items
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(items, forKey: "items")
    }
}
