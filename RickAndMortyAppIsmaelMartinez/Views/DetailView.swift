//
//  DetailView.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 18/8/23.
//

import SwiftUI

struct DetailView: View {
    var character: CharacterModel
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .center) {
                
               
                if !(character.uiImage?.isEmpty ?? true) {
                    Image(uiImage: UIImage(data: character.uiImage!) ?? UIImage(named: "placeholder.png")!).padding()
                } else {
                    AsyncImage(url: URL(string: character.image ?? "")).padding()
                }
                VStack(alignment: .leading){
                    Text("Nombre: \(character.name ?? "???")")
                    Text("Estatus: \(character.status ?? "???")")
                    Text("Tipo: \(character.type ?? "???")")
                    Text("Género: \(character.gender ?? "???")")
                    Text("Orígen: \(character.origin?.name ?? "???")")
                    Text("Localización: \(character.location?.name ?? "???")")
                    Text("Created: \(character.created ?? "???")")
                    Text("Episodios:")
                    ScrollView{
                        
                        ForEach(character.episode ?? [], id: \.self){episode in
                            Text(episode)

                        }
                    }
                    
                }.padding().overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 2)
                )

            }
            .padding()
        }.navigationTitle("DetailView")

    }
}

