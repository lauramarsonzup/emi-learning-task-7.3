//
//  Livro.swift
//  LearningTask-7.3
//
//  Created by Laura Pinheiro Marson on 08/11/22.
//

import Foundation

struct Livro {
    var titulo: String
    var imagem: String
    
    init(titulo: String) {
        self.titulo = titulo
        self.imagem = titulo
    }
}

extension Livro: BookViewCellData {}
