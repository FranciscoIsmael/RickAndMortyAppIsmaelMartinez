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
    
    override func getAllCharacters(page: Int?, completion: @escaping (Result<[CharacterModel], CustomError>) -> ()){
        
        if page == 0 {
            
            
            let characterList = [CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: OriginModel(name: "originName", url: "originUrl"), location: LocationModel(name: "locationName", url: "locationUrl"), image: "image", episode: ["episode0","episode1"], url: "url", created: "created")]
            completion(.success(characterList))
            
            expectation.fulfill()
            
        } else {
            completion(.failure(CustomError(errorText: "getAllCharactersError")))
            expectation.fulfill()
        }
        
        
    }
    override func filterCharacters(filter: CharacterFilterModel, completion: @escaping(Result<[CharacterModel], CustomError>) -> ()){
        
        if filter.name == "success" {
            let characterList = [CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: OriginModel(name: "originName", url: "originUrl"), location: LocationModel(name: "locationName", url: "locationUrl"), image: "image", episode: ["episode0","episode1"], url: "url", created: "created")]
            completion(.success(characterList))
            
            expectation.fulfill()
        } else {
            completion(.failure(CustomError(errorText: "filterCharactersError")))
            expectation.fulfill()
        }
        
    }
}
