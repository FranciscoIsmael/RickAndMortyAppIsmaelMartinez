//
//  FilterText.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 18/8/23.
//

import Foundation
import SwiftUI

struct FilterText: View {
    
    @StateObject var vm: CharacterViewModel
    @State private var show: Bool = false
    
    @State var name: String = ""
    @State var status: String = ""
    @State var species: String = ""
    @State var type: String = ""
    @State var gender: String = ""
    
    
    var body: some View{
        HStack{
            TextField("Buscar", text: $name)
            Button {
                let filter = CharacterFilterModel(name: name, status: status, species: species, type: type, gender: gender)
                PageSingleton.instance.page = 1
                vm.filterCharacter(filter: filter)
            } label: {
                Image(systemName: "magnifyingglass")
            }
            
            Spacer()
            
            Button {
                show = !show
  
            }label: {
                Image(systemName: "list.bullet.rectangle.portrait")
            }.sheet(isPresented: $show){
                VStack{
                    TextField("Buscar estatus", text: $status)
                    TextField("Buscar especie", text: $species)
                    TextField("Buscar tipo", text: $type)
                    TextField("Buscar genero", text: $gender)

                    
                }.padding()
            }
            Button{
                status = ""
                species = ""
                type = ""
                gender = ""
                name = ""
            }label: {
                Image(systemName: "trash")
            }
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 1)
        )
    }
}
