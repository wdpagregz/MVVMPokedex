import SwiftUI

struct ContentViewEnemy: View {
    @StateObject var vm = ViewModel()
    
    let mypokemon: Pokemon // definir o pokemon ja escolhido
    let mynumero:Int
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
      
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(mypokemonview: mypokemon,mynumeroview: mynumero,enemynumeroview: vm.getPokemonIndex(pokemon: pokemon),enemypokemonview: pokemon)
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

