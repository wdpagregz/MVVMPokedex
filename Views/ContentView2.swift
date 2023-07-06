//
//  ContentView2.swift
//  MVVMPokedex
//
//  Created by Developer on 06/07/2022.
//

import SwiftUI

struct ContentViewEnemy: View {
    @StateObject var vm = ViewModel()
    
    let mypokemon: Pokemon
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(mypokemonview: mypokemon,enemypokemonview: pokemon)
                        ) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Choose Enemy Pokemon")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

struct ContentViewEnemy_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewEnemy(mypokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
