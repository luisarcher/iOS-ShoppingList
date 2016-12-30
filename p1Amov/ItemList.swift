//
//  ItemList.swift
//  p1Amov
//
//  Created by Luís Miguel Coelho Jordão on 30/12/2016.
//  Copyright © 2016 Luís Miguel Coelho Jordão. All rights reserved.
//

import Foundation

class ItemList: NSObject {

    var nome : String
    var items = [Item]()
    
    init(n: String){
        self.nome = n;
        items = [Item]()
    }
    
    func adicionarItem(item : Item){
        items.append(item)
    }
    
    func getListaProdutos() -> [Item] {
        return items
    }
    
    func getNumProdutos() -> Int {
        return items.count
    }
    
    func getNome() -> String {
        return nome
    }
}
