import Foundation


struct PokemonPage: Codable {
    //let count: Int
    //let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}
// codable pode se converter dentro e fora de uma representaçao

struct DetailPokemon: Codable,Identifiable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [Stat]
    let types: [Types]
}


struct Stat: Codable{
    var base_stat:Int
    var effort:Int
    //var stat:StatInfo
    
    /*private var stat:StatInfo
    var nome:String{
        stat.name
    }*/
}

/*struct StatInfo{
    var name:String
}*/

struct Types: Codable{
    var type:TypeInfo
}

struct TypeInfo: Codable{
    var name:String
}



