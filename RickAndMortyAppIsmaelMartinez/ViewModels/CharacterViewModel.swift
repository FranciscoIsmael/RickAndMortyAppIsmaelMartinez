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
    
    
}
