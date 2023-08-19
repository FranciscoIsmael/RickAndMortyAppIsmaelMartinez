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
            
            VStack(alignment: .leading) {
                
                Text("Nombre: \(character.name ?? "???")")
                AsyncImage(url: URL(string: character.image ?? "???"))
                Text("Estatus: \(character.status ?? "???")")
                Text("Tipo: \(character.type ?? "???")")
                Text("Género: \(character.gender ?? "???")")
                Text("Orígen: \(character.origin?.name ?? "???")")
                Text("Localización: \(character.location?.name ?? "???")")
                Text(character.created ?? "???")
                
                ScrollView{
                    
                    ForEach(character.episode ?? [], id: \.self){episode in
                        Text(episode)

                    }
                }
                
            }
            .padding()
        }.navigationTitle("DetailView")

    }
}

