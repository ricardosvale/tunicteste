//
//  DesafioViewModel.swift
//  TunicTeste
//
//  Created by Ricardo Silva Vale on 06/11/24.
//

import SwiftUI

import Foundation

class DesafioViewModel: ObservableObject{
    @Published var desafios: [Desafio]
    @Published var desafioById: Desafio?
    @Published var objetivos: [Objetivo] = []
    @Published var objetivoCriado: Objetivo?
    @Published var desafioID = "E91FEF1E-FF2B-42C9-BBF8-DAC63A307CE0"
    
    init(){
        self.desafios = []
        fetchDesafios()
        
    }
    
    func fetchDesafios(){
        DesafioService.singleton.getDesafios { [weak self] desafios in
            DispatchQueue.main.async {
                self?.desafios = desafios
            }
        }
    }
    
    func getDesafioById(id: String) {
        DesafioService.singleton.getDesafioById(id: id) { [weak self] desafio in
            //DispatchQueue.main.async {
                self?.desafioById = desafio
            //}
        }
    }
    
    func loadObjetivos(for desafioID: String){
        DesafioService.singleton.objetivoPorDesafio(desafioID: desafioID){ [weak self] objetivos in
            if let objetivos = objetivos {
                DispatchQueue.main.async {
                    self?.objetivos = objetivos
                }
            } else{
                print("Nenhum objetivo encontrado para o desafio com ID: \(desafioID)")
            }
        }
    }
    
    func createObjetivo(_ objetivo: Objetivo, desafioID:String){
        DesafioService.singleton.createObjetivo(objetivo, desafioID: desafioID){ [weak self] objetivoCriado in
            DispatchQueue.main.async{
                self?.objetivoCriado = objetivoCriado
            }
        }
        
    }
}
