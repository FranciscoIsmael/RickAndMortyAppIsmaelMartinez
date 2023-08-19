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
    
    @State private var name: String = ""
    @State private var status: String = ""
    @State private var species: String = ""
    @State private var type: String = ""
    @State private var gender: String = ""
    
    
    var body: some View{
        HStack{
            TextField("Buscar", text: $name)
            Button {
                let filter = CharacterFilterModel(name: name, status: status, species: species, type: type, gender: gender)
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
        }.padding()
    }
}
