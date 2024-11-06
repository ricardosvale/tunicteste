//
//  TurmaModel.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import Foundation

struct Turma: Identifiable,Codable  {
    var id: String?
    let nome: String
    var desafioAtual: String
    var desafios: [Desafio]?
    var planoEnsino: String
    var codigoTurma: String
    var dataInicio: Date
    var dataFim: Date
    var turmaAtiva: Bool
    var alunos: [Aluno]
    var mentor: Mentor
    var isDeleteMode: Bool
    
    struct Aluno: Identifiable, Codable, Hashable {
        let id: Int
        var nome: String
    }
    
    struct Desafio: Identifiable, Codable{
        let id: Int
        var nome: String
    }
    
    struct Mentor: Identifiable, Codable {
        let id: String
        var nome: String?
        var planos: [String]
    }
    
    
    
    static let turmaExemplo1 = Turma(id: "2A87810F-1835-4926-84F1-8E1706079381", nome: "Tauá", desafioAtual: "Aplicativo usando API", planoEnsino: "Plano A", codigoTurma: "31213", dataInicio: .init(), dataFim: .init(), turmaAtiva: true, alunos: [Turma.Aluno(id: 1, nome: "Aluno 1"), Turma.Aluno(id: 2, nome: "Aluno 2")], mentor: Turma.Mentor(id: "B67B66AB-F03C-4641-8F2A-EDAA0077490A", planos: ["Plano 1", "Plano 2"]), isDeleteMode: false)
    
    
    
    static let listaTurmas: [Turma] = [turmaExemplo1]
}
