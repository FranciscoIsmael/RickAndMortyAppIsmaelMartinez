//
//  CharacterViewModel.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

final class CharacterViewModel: ObservableObject {
    private let provider: ProviderProtocol
    
    init(provider: ProviderProtocol){
        self.provider = provider
    }
    
    @Published var characterList: Characters = Characters()
    @Published var searchText = ""
    @Published var errorMessage = ""
    var filterUsed: CharacterFilterModel?
    
    func getAllCharacters(){
        provider.getAllCharacters() { result in

            switch result {
            case .success(let characters):
                self.characterList = characters
                self.errorMessage = ""
            case .failure(let error):
                self.errorMessage = error.errorText
            }
        }
    
    }
    
    func filterCharacter(filter: CharacterFilterModel){
        self.filterUsed = filter
        provider.filterCharacters(filter: filter) { result in
            switch result {
            case .success(let characters):
                self.characterList = characters
                self.errorMessage = ""
            case .failure(let error):
                self.errorMessage = error.errorText
            }
        }
        
    }
    
    func changePage(){
        
        if filterUsed?.name.isEmpty ?? true {
            getAllCharacters()
        } else {
            filterCharacter(filter: filterUsed ?? CharacterFilterModel(name: "", status: nil, species: nil, type: nil, gender: nil))
        }
        
    }
    
}
