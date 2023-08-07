//
//  ContentView.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokeDexViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(viewModel.allPokeDex) { singlePoke in
                    Text(singlePoke.name)
                }
            }
            .onAppear() {
                viewModel.getPokeDex()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
