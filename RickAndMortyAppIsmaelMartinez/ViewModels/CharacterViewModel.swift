//
//  CharacterViewModel.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

final class CharacterViewModel: ObservableObject {
    private let provider = Provider()
    
    @Published var characterList = [CharacterModel]()
    @Published var searchText = ""
    @Published var errorMessage = ""
    
    func getAllCharacters(page: Int?){
        provider.getAllCharacters(page: page) { result in

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
