//
//  MockProvider.swift
//  RickAndMortyAppIsmaelMartinezTests
//
//  Created by Ismael 2 on 19/8/23.
//

import Foundation
import XCTest

class MockProvider: ProviderProtocol{
    
    var expectation: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expectation = expectation
    }
    
    override func getAllCharacters(completion: @escaping (Result<Characters, CustomError>) -> ()){
        let characterList = [CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: OriginModel(name: "originName", url: "originUrl"), location: LocationModel(name: "locationName", url: "locationUrl"), image: "image", episode: ["episode0","episode1"], url: "url", created: "created")]
        let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
        let characters = Characters(info: info, results: characterList)
        completion(.success(characters))
        
        expectation.fulfill()
    }
    override func filterCharacters(filter: CharacterFilterModel, completion: @escaping(Result<Characters, CustomError>) -> ()){
        
        let characterList = [CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: OriginModel(name: "originName", url: "originUrl"), location: LocationModel(name: "locationName", url: "locationUrl"), image: "image", episode: ["episode0","episode1"], url: "url", created: "created")]
        let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
        let characters = Characters(info: info, results: characterList)
        completion(.success(characters))
        
        expectation.fulfill()
        
    }
}

class MockProviderError: ProviderProtocol {
    
    
    var expectation: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expectation = expectation
    }
    
    override func getAllCharacters(completion: @escaping (Result<Characters, CustomError>) -> ()){
        completion(.failure(CustomError(errorText: "getAllCharactersError")))
        expectation.fulfill()
    }
    override func filterCharacters(filter: CharacterFilterModel, completion: @escaping(Result<Characters, CustomError>) -> ()){
        
        completion(.failure(CustomError(errorText: "filterCharactersError")))
        expectation.fulfill()
        
    }
    
    
}
