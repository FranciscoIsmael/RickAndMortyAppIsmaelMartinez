//
//  ContentView.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var vm = CharacterViewModel()
    var body: some View {
        
        FilterText(vm: vm)
        
        NavigationView{
            
            VStack {
                ScrollView{
                        ForEach(vm.characterList){character in
                            
                            NavigationLink(destination: DetailView(character: character)){
                                VStack{
                                    Text(character.name ?? "").background(Color.white)
                                    
                                    if !(character.uiImage?.isEmpty ?? true) {
                                        Image(uiImage: UIImage(data: character.uiImage!) ?? UIImage(named: "placeholder.png")!)
                                    } else {
                                        AsyncImage(url: URL(string: character.image ?? ""))
                                    }
                                    
                                }
                                
                            }


                        }
                }.background(Color.red)
                    .zIndex(2)
                    
                
            }
            .padding()
            .onAppear{
                vm.getAllCharacters(page: nil)
            }
            
            
        }.navigationTitle("CharacterView")
        
    }
}