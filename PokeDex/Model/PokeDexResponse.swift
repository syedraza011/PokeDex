//
//  PokeDexResponse.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import Foundation
struct PokeDexReponse: Decodable {
    let id : Int
    let name: String
    let url: URL
}
