import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    var pokemonDetailsHP: Int
    var pokemonDetailsHP2: Int
    var pokemonDetailsAtack: Int
    var pokemonDetailsAtack2: Int
    var pokemonDetailsDef: Int
    var pokemonDetailsDef2: Int
    var pokemonDetailsType: String
    var pokemonDetailsType2: String
    @Published var searchText = ""
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
                return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
            }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        self.pokemonDetailsHP = 0
        self.pokemonDetailsHP2 = 0
        self.pokemonDetailsAtack = 0
        self.pokemonDetailsAtack2 = 0
        self.pokemonDetailsDef = 0
        self.pokemonDetailsDef2 = 0
        self.pokemonDetailsType = ""
        self.pokemonDetailsType2 = ""
    }
    
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
                
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, stats: [Stat(base_stat: 10,effort: 10)], types: [Types(type: TypeInfo(name: "Normal"))])
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
        
    // Get HP details for a pokemon
    func getDetailsHP(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsHP = data.stats[0].base_stat
            }
        }
        
        return pokemonDetailsHP
    }
    
    func getDetailsHP2(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsHP2 = data.stats[0].base_stat
            }
        }
        
        return pokemonDetailsHP2
    }
    
    
    // Get HP details for a pokemon
    func getDetailsAtack(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsAtack = data.stats[1].base_stat
            }
        }
        
        return pokemonDetailsAtack
    }
    
    
    // Get HP details for a pokemon
    func getDetailsAtack2(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsAtack2 = data.stats[1].base_stat
            }
        }
        
        return pokemonDetailsAtack2
    }
    
    
    // Get HP details for a pokemon
    func getDetailsDef(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsDef = data.stats[2].base_stat
            }
        }
        
        return pokemonDetailsDef
    }
    
    
    // Get HP details for a pokemon
    func getDetailsDef2(id: Int) -> Int{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsDef2 = data.stats[2].base_stat
            }
        }
        
        return pokemonDetailsDef2
    }
    
    
    
    
    // Get Type details for a pokemon
    func getDetailsType(id: Int) -> String{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsType = data.types[0].type.name
            }
        }
        
        return pokemonDetailsType
    }
    
    
    // Get Type details for a pokemon
    func getDetailsType2(id: Int) -> String{
                
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsType2 = data.types[0].type.name
            }
        }
        
        return pokemonDetailsType2
    }
    
    
    
    
    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
    
    // Formats the Height or the Weight of a given pokemon
    /*func formatHP(value: [Stat]) -> String {
        let string = String("\(value)")
        
        return string
    }*/
    
}
