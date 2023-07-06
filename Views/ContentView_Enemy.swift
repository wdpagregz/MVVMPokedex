//
//  ContentView_Enemy.swift
//  MVVMPokedex
//
//  Created by Developer on 20/07/2022.
//

import SwiftUI

struct ContentView_Enemy: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let mypokemon: Pokemon
    let mynumero:Int
    //let myhp: Int
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
                
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(mypokemonview: mypokemon,mynumeroview: mynumero,myhpview: vm.pokemonDetails?.stats[0].base_stat ?? 777,enemypokemonview: pokemon)
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

/*struct ContentView_Enemy_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Enemy()
    }
}*/
