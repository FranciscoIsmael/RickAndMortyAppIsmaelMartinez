//
//  CharacterModel.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

struct Characters: Codable {
    var results: [CharacterModel]?
}

struct CharacterModel: Codable, Identifiable {
    
    let id: Int?
    let name: String?
    let status: String?
    let type: String?
    let gender: String?
    let origin: OriginModel?
    let location: LocationModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    var uiImage: Data?
    
    
    
}

class CharacterCacheModel{
    let characters: [CharacterModel]
    let id: Int

    init(characters: [CharacterModel], id: Int) {
        self.characters = characters
        self.id = id
    }
}
