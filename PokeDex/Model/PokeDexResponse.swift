//
//  PokeDexResponse.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import Foundation


struct PokeDexReponse: Decodable {
    
    let results: [PokeDexes]
}
struct PokeDexes: Decodable, Identifiable{
    let id = UUID()
    let name:String
    let url : String
  
}

