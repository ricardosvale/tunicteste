//
//  ObjetivoModel.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//


import Foundation

struct Objetivo: Codable, Identifiable {
    let id: UUID
    let nome: String
    let descricao: String
    let materialEstudo: String
    //let entregaAluno: String
    let desafio: Desafio
    let status: String?
    
    init(id: UUID, nome: String, descricao: String, materialEstudo: String, desafio: Desafio, status: String) {
        self.id = id
        self.nome = nome
        self.descricao = descricao
        self.materialEstudo = materialEstudo
        //self.entregaAluno = entregaAluno
        self.desafio = desafio
        self.status = status
    }
    
    static let objetivo1 = Objetivo(id: UUID(), nome: "Implementar CRUD", descricao: "Criar, ler, atualizar e deletar tarefas", materialEstudo: "Documentação do Swift", desafio: Desafio.desafio1, status: "Em Andamento")
    static let objetivo2 = Objetivo(id: UUID(), nome: "Design da Interface", descricao: "Criar um layout intuitivo para o aplicativo", materialEstudo: "Tutoriais de design UI/UX", desafio: Desafio.desafio1, status: "Concluído")
    static let objetivo3 = Objetivo(id: UUID(), nome: "Testes de Funcionalidade", descricao: "Testar todas as funcionalidades do aplicativo", materialEstudo: "Artigos sobre testes em Swift", desafio: Desafio.desafio1, status: "Not Started")

    static let objetivosList: [Objetivo] = [objetivo1, objetivo2, objetivo3]
}
