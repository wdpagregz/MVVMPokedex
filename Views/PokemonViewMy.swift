//pokemon ja selecionado na pag final
import SwiftUI

struct PokemonViewMy: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let numero: Int
    let dimensions: Double = 140
    
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(numero).png")) { image in
                if let image = Optional(image) {
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
