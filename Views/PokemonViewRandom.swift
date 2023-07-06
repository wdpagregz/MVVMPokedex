//
//  PokemonViewRandom.swift
//  MVVMPokedex
//
//  Created by Developer on 06/07/2022.
//

import SwiftUI

struct PokemonViewRandom: View {
    @EnvironmentObject var vm: ViewModel
    
    let pokemon: Int
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
                    
            }
            .background(.thinMaterial)
            .clipShape(Circle())

            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)

        }
    }
}

struct PokemonViewRandom_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewRandom(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
