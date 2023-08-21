//
//  CharacterModel.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

struct Characters: Codable {
    var info: PageInfoModel?
    var results: [CharacterModel]?
    
    init(){
        self.info = nil
        self.results = []
    }
    
    init(info: PageInfoModel, results: [CharacterModel]) {
        self.info = info
        self.results = results
    }
    
}

struct CharacterModel: Codable, Identifiable, Equatable {
    
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
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
    
    let characters: [CharacterModel]
    let id: Int

    init(characters: Characters, id: Int) {
        self.characters = characters.results ?? []
        self.id = id
        self.count = characters.info?.count
        self.pages = characters.info?.pages
        self.next = characters.info?.next
        self.prev = characters.info?.prev
    }
}
