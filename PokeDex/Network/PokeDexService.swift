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
    
    var Discritption: String {
    switch self{
    case .invalidUrl:
        return "Invalild URL"
    case .errorDecoding:
        return "Error Decoding"
    case .invalidResponse:
        return "Invalild Response"
    }
    }
}
protocol PokeDexServiceProtocol {
    func fetchPokeDex () async throws -> PokeDexReponse
        
}
class PokeDexService: PokeDexServiceProtocol {
    
    
    let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0"
    
    func fetchPokeDex() async throws -> PokeDexReponse { // Fixed the typo in the return type
        guard let url = URL(string: urlString) else {
            throw APIError.invalidUrl
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            return try JSONDecoder().decode(PokeDexReponse.self, from: data)
        } catch {
            print(error)
            throw APIError.errorDecoding
        }
        
    }
}


