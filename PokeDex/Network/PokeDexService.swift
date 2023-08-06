//
//  PokeDexService.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case errorDecoding
    case invalidResponse
    switch discription {
    case invalidUrl:
        return "Invalild URL"
    case errorDecoding:
        return "Error Decoding"
    case invalidResponse:
        return "Invalild Response"
    }
}
protocol PokeDexServiceProtocol {
    func fetchPokeDex () async throws -> PokeDexReponse
        
}
class PokeDexService () async throws -> PokeDexReponse {
    
    let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0"
    
    func fetchPokeDex() async throws -> PokeDexReponse{
      
        guard let url = URL(string: url) else {
            APIError.invalidUrl
        }
        
    }
}
