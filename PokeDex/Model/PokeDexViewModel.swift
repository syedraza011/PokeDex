//
//  PokeDexViewModel.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import Foundation
class PokeDexViewModel: ObservableObject {
    @Published var allPokeDex :[PokeDexes] = []
    
    let service: PokeDexServiceProtocol
    
    init(service: PokeDexServiceProtocol = PokeDexService()){
        self.service = service
    }

        @MainActor func getPokeDex() {
            Task{
                do{
                   let result = try await service.fetchPokeDex()
                    allPokeDex = result.results
                    
                 
                   
                }catch {
                    print(error)
                }
            }
        }
    }
    
