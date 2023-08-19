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
//            ImageCache.instance.addAllImages(characterList: result) { isLoaded in
//                if isLoaded {
//                    var arrayAux = result
//                    var index = 0
//                    result.forEach{character in
//
//                        let imgCache = ImageCache.instance.get(id: "\(character.id ?? 0)") as! String
//
//                        arrayAux[index].uiImage = imgCache.data(using: .utf8)
//                        index += 1
//
//                    }
//
//                    self.characterList = arrayAux
//
//                }
//            }
            self.characterList = result
        }
    
    }
    
    func filterCharacter(filter: CharacterFilterModel){
        let response = provider.filterCharacters(filter: filter) { result in
            self.characterList = result
        }
        
    }
    
    
}
