import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
                
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in //ForEach vai buscar na var filteredPokemon o arg pokemon
                        
                        NavigationLink(destination: ContentViewEnemy(mypokemon: pokemon,mynumero: vm.getPokemonIndex(pokemon: pokemon))
                        ) {
                            PokemonView(pokemon: pokemon)
                        }
                    }

                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Choose Your Pokemon")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText) // barra de pesquisa
        }
        .environmentObject(vm) // exibir um objeto observavel (nesse caso o selecionado)
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
