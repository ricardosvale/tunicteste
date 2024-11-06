//
//  DesafioModel.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import Foundation

struct Desafio: Codable, Identifiable {
    let id: UUID
    let bigIdea: String?
    let solution: String?
    let objetivos: [Objetivo]?
    
    
    init(id: UUID, bigIdea: String, solution: String, objetivos: [Objetivo]) {
        self.id = id
        self.bigIdea = bigIdea
        self.solution = solution
        self.objetivos = objetivos
    }
    
    static let desafio1 = Desafio(id: UUID(), bigIdea: "Criar um aplicativo de lista de tarefas", solution: "Aplicativo que permite criar, editar e deletar tarefas.", objetivos: [])
    
}
