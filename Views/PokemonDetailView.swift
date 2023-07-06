import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    let mypokemonview: Pokemon
    let mynumeroview: Int
    
    let enemynumeroview: Int
    let enemypokemonview: Pokemon
    
    @State private var progress = 100
    @State private var progress2 = 100
    

    	
    var body: some View {
            
        VStack {
            PokemonViewEnemy(pokemon: enemypokemonview)
        }
        //antes de aparecer buscar os valores do pokemon
        .onAppear {
            vm.getDetails(pokemon: enemypokemonview)
        }
        .position(x: 270, y: 150)
    
        

        
        VStack(spacing: 10) {
            Text("**Hp**: \(vm.getDetailsHP2(id: enemynumeroview))")
            Text("**Atack**: \(vm.getDetailsAtack2(id: enemynumeroview))")
            Text("**Def**: \(vm.getDetailsDef2(id: enemynumeroview))")
            
            
            ProgressView("Hp",value: Double(progress2) ,total: Double(vm.getDetailsHP2(id: enemynumeroview)))
                .tint(Color.green)
                .shadow(color: Color(red: 0, green: 0.6, blue: 0), radius: 4.0, x: 1.0, y: 2.0)
                .scaleEffect(0.5,anchor: .center)

        }
        .padding()
        .position(x: 100, y: 0)
        
     
        

                
        VStack {
            PokemonViewMy(pokemon: mypokemonview,numero: mynumeroview)
        }
        .onAppear {
            vm.getDetails(pokemon: mypokemonview)
        }
        .position(x: 100, y: 200)
        
        
        
        VStack(spacing: 10) {
            Text("**Hp**: \(vm.getDetailsHP(id: mynumeroview))")
            Text("**Atack**: \(vm.getDetailsAtack(id: mynumeroview))")
            Text("**Def**: \(vm.getDetailsDef(id: mynumeroview))")
            
            
            ProgressView("Hp",value: Double(progress),total: Double(vm.getDetailsHP(id: mynumeroview)))
                .tint(Color.green)
                .shadow(color: Color(red: 0, green: 0.6, blue: 0), radius: 4.0, x: 1.0, y: 2.0)
                .scaleEffect(0.5,anchor: .center)
                

        }
        .padding()
        .position(x: 270, y: 40)
        
        
        var dmg = vm.getDetailsAtack(id: mynumeroview)
        var dmg2 = vm.getDetailsAtack2(id: enemynumeroview)
        
        /*var dmg_ = vm.getDetailsAtack(id: mynumeroview) - (vm.getDetailsDef2(id: enemynumeroview) / 1)
        var dmg2_ = vm.getDetailsAtack2(id: enemynumeroview) - (vm.getDetailsDef(id: mynumeroview) / 1)*/
        
        var type = vm.getDetailsType(id: mynumeroview)
        var type2 = vm.getDetailsType2(id: enemynumeroview)
        
        
        
        VStack(spacing: 10) {
            
            Button("Fight", action: {
                
                
                dmg = multi(_dmg: dmg, _dmg2: dmg2, type: type, type2: type2)
                dmg2 = multi(_dmg: dmg2, _dmg2: dmg, type: type2, type2: type)
                
                dmg = dmg - vm.getDetailsDef2(id: enemynumeroview)
                dmg2 = dmg2 - vm.getDetailsDef(id: mynumeroview)
                
                if(progress2 > vm.getDetailsHP2(id: enemynumeroview)){
                    progress2 = vm.getDetailsHP2(id: enemynumeroview)
                    
                    progress2 -= dmg
                }else{
                        progress2 -= dmg
                }
                                
                
                if(progress > vm.getDetailsHP(id: mynumeroview)){
                    progress = vm.getDetailsHP(id: mynumeroview)
                    
                    progress -= dmg2
                }else{
                    progress -= dmg2
                }
                
            })
        }
        .padding()
        .position(x: 190, y: 80)
        
    }
}


func multi(_dmg: Int, _dmg2: Int, type: String, type2: String)->Int{
    
   var dmg = _dmg // variavel de dano em relaçao ao type de cada pokemon
    
    switch type{

    case "bug":
        
        switch type2{
        case "fire":
            dmg

        case "flying":
            dmg

        case "grass":
            dmg *= 2

        case "poison":
            dmg *= 2

        case "psychic":
            dmg *= 2

        case "rock":
            dmg

        default:
            dmg
        }

    case "dragon":
            dmg

    case "electric":

        switch type2{
        case "electric":
            dmg

        case "flying":
            dmg *= 2

        case "grass":
            dmg

        case "ground":
            dmg = 0

        default:
            dmg
        }

    case "fighting":

    switch type2{

        case "flying":
            dmg

        case "ghost":
            dmg = 0

        case "ice":
            dmg *= 2

        case "normal":
            dmg *= 2

        case "psychic":
            dmg

        case "rock":
            dmg *= 2

        default:
            dmg
        }

    case "fire":

    switch type2{
        case "bug":
            dmg *= 2

        case "grass":
            dmg *= 2

        case "ice":
            dmg *= 2

        case "rock":
            dmg

        default:
            dmg
        }

    case "flying":

    switch type2{
        case "bug":
            dmg *= 2

        case "electric":
            dmg

        case "fighting":
            dmg *= 2

        case "grass":
            dmg *= 2

        case "rock":
            dmg

        default:
            dmg
        }

    case "ghost":

    switch type2{
        case "psychic":
            dmg = 0

        case "normal":
            dmg = 0

        default:
            dmg
        }

    case "grass":

    switch type2{
        case "bug":
            dmg

        case "fire":
            dmg

        case "flying":
            dmg

        case "grass":
            dmg

        case "ground":
            dmg *= 2

        case "poison":
            dmg

        case "rock":
            dmg *= 2

        case "water":
            dmg *= 2

        default:
            dmg
        }

    case "ground":

    switch type2{
        case "electric":
            dmg *= 2

        case "fire":
            dmg *= 2

        case "flying":
            dmg = 0

        case "grass":
            dmg

        case "poison":
            dmg *= 2

        case "rock":
            dmg *= 2

        default:
            dmg
        }

    case "ice":

    switch type2{
    case "dragon":
            dmg *= 2

        case "flying":
            dmg *= 2

        case "grass":
            dmg *= 2

        case "ground":
            dmg *= 2

        case "ice":
            dmg

        case "water":
            dmg

        default:
            dmg
        }

        case "normal":

    switch type2{
        case "ghost":
            dmg = 0

        default:
            dmg
        }

    case "poison":

    switch type2{
        case "bug":
            dmg *= 2

        case "grass":
            dmg *= 2

        case "ground":
            dmg

        case "poison":
            dmg

        case "rock":
            dmg

        default:
            dmg
        }

    case "psychic":

    switch type2{
        case "fighting":
            dmg *= 2

        case "poison":
            dmg *= 2

        case "psychic":
            dmg

        default:
            dmg
        }

    case "rock":

    switch type2{
        case "bug":
            dmg *= 2

        case "fighting":
            dmg

        case "fire":
            dmg *= 2

        case "flying":
            dmg *= 2

        case "ice":
            dmg *= 2

        case "rock":
            dmg

        default:
            dmg
        }

    case "water":

    switch type2{
    case "fire":
            dmg *= 2

        case "grass":
            dmg

        case "ground":
            dmg *= 2

        case "ice":
            dmg

        case "rock":
            dmg *= 2

        default:
            dmg
        }

    default:
        dmg
    }
 
    return dmg
}

/*
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(/*mypokemonview: Pokemon.samplePokemon*/mynumeroview: <#T##Int#>, enemypokemonview: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
 */

