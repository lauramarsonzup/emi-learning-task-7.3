//
//  LivrosAPI.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 16/05/2022.
//

import Foundation

class LivrosAPI {
    
    func carregaLivros() -> [Livro] {
        return [
            Livro(titulo: "Orientação a Objetos"),
            Livro(titulo: "ECMAScript 6"),
            Livro(titulo: "React Native"),
            Livro(titulo: "Orientação a Objetos e SOLID para Ninjas"),
            Livro(titulo: "Play Framework"),
            Livro(titulo: "Spring MVC"),
            Livro(titulo: "Kotlin com Android"),
            Livro(titulo: "Entrega contínua em Android"),
            Livro(titulo: "Flutter Framework"),
        ]
    }
    
}
