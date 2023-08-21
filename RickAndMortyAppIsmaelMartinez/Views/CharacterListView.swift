//
//  ContentView.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var vm = CharacterViewModel(provider: Provider())
    var body: some View {
        
        FilterText(vm: vm)
        if !vm.errorMessage.isEmpty{
            Text(vm.errorMessage).background(Color.red)
        }
        NavigationView{
            
            VStack {
                ScrollView{
                    ForEach(vm.characterList.results ?? []){character in
                            
                            NavigationLink(destination: DetailView(character: character)){
                                VStack{
                                   
                                    if !(character.uiImage?.isEmpty ?? true) {
                                        Image(uiImage: UIImage(data: character.uiImage!) ?? UIImage(named: "placeholder.png")!)
                                    } else {
                                        AsyncImage(url: URL(string: character.image ?? ""))
                                    }
                                    Text(character.name ?? "").background(Color.white)
                                    
                                }
                            }
                        }
                    
                    HStack{
                        if !(vm.characterList.info?.prev?.isEmpty ?? true){
                            Button{
                                PageSingleton.instance.page -= 1
                                vm.getAllCharacters()
                            }label: {
                                Text("Anterior")
                            }
                        }
                        Spacer()
                        if !(vm.characterList.info?.next?.isEmpty ?? true){
                            Button{
                                PageSingleton.instance.page += 1
                                vm.getAllCharacters()
                            }label: {
                                Text("Siguiente")
                            }
                        }
                    }
                    
                }.background(Color.red)
                    .zIndex(2)
                    
                
            }
            .padding()
            .onAppear{
                vm.getAllCharacters()
            }
            
            
        }.navigationTitle("CharacterView")
        
    }
}
