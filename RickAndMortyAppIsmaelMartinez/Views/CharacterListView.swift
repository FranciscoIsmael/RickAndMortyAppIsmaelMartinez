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
        
        
        if !vm.errorMessage.isEmpty{
            Text(vm.errorMessage).background(Color.red)
        }
        NavigationView{
            VStack {
                FilterText(vm: vm)
                ScrollView{
                    ForEach(vm.characterList.results ?? []){character in
                            
                            NavigationLink(destination: DetailView(character: character)){
                                VStack{
                                   
                                    if !(character.uiImage?.isEmpty ?? true) {
                                        Image(uiImage: UIImage(data: character.uiImage!) ?? UIImage(named: "placeholder.png")!)
                                    } else {
                                        AsyncImage(url: URL(string: character.image ?? ""))
                                    }
                                    Text(character.name ?? "")
                                    
                                }
                            }
                        }
                    
                    HStack{
                        if !(vm.characterList.info?.prev?.isEmpty ?? true){
                            
                            
                            Button{
                                PageSingleton.instance.prev()
                                vm.changePage()
                            }label: {
                                Text("Anterior")
                            }
                        }
                        Spacer()
                        if !(vm.characterList.info?.next?.isEmpty ?? true){
                            Button{
                                PageSingleton.instance.next()
                                vm.changePage()
                            }label: {
                                Text("Siguiente")
                            }
                        }
                    }
                    
                }
                    
                
            }
            .padding()
            .onAppear{
                vm.getAllCharacters()
            }
            
            
        }.navigationTitle("CharacterView")
        
    }
}
