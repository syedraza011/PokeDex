//
//  ContentView.swift
//  PokeDex
//
//  Created by Syed Raza on 8/6/23.

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel = PokeDexViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView (showsIndicators: false) {
                    ForEach(Array(viewModel.allPokeDex.enumerated()), id: \.1.id) { index, singlePoke in
                        VStack {
                            HStack {
                                PokeImage(singlePoke.name)
                                   
                                VStack(alignment: .leading) {
                                    Text(singlePoke.name.capitalized)
                                    Text("#\(index + 1)")
                                        .foregroundColor(.gray)
                                    HStack {
                                        Text("see")
                                        NavigationLink ("More") {
                                            Text(singlePoke.name.capitalized)
                                            
                                        }
                                    }
                                }.padding(20)
                            }
                        }.padding(30)
                    }
                }
                .onAppear() {
                    viewModel.getPokeDex()
                }
            }
            .padding()
            .navigationBarTitle("PokéDex")
        }
    }

    @ViewBuilder // Specify that this function returns a View
    private func PokeImage(_ pokeName: String) -> some View {
        if let imageURL = URL(string: "https://img.pokemondb.net/artwork/large/\(pokeName.lowercased()).jpg") {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100) 
            } placeholder: {
                ProgressView()
            }
        } else {
            Text("No image available")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
