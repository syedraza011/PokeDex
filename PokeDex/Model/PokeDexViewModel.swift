//
//  PokeDexViewModel.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import Foundation
class PokeDexViewModel: ObservableObject {
    @Published var allPokeDex = PokeDexReponse()
    let service: PokeDexServiceProtocol
    
    init(service: pokeDexServiceProtocol = PokeDexService()){
        self.service = service
    }
    @MainActor getPokeDex() {
        Task{
            do{
                allPokeDex = try await service.fetchPokeDex()
            }catch {
                print(error)
            }
        }
    }
    
}
