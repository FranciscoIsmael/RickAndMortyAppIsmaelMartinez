//
//  CharacterViewModelTests.swift
//  RickAndMortyAppIsmaelMartinezTests
//
//  Created by Ismael 2 on 19/8/23.
//

import Foundation
import XCTest

final class CharacterViewModelTests: XCTestCase {
    
    func test_getAllCharacters_Success(){
        let exp = expectation(description: "getAllCharactersSuccess")
        let vm = CharacterViewModel(provider: MockProvider(expectation: exp))
        
        vm.getAllCharacters()
        
        waitForExpectations(timeout: 0.5)
        XCTAssertTrue(vm.characterList.results?.count != 0)
        
    }
    
    func test_getAllCharacters_Error(){
        let exp = expectation(description: "getAllCharactersError")
        let vm = CharacterViewModel(provider: MockProviderError(expectation: exp))
        
        vm.getAllCharacters()
        
        waitForExpectations(timeout: 0.5)
        XCTAssertTrue(vm.errorMessage == "getAllCharactersError")
        
    }
    
    func test_filterCharacter_success(){
        let exp = expectation(description: "filterCharacterSuccess")
        let vm = CharacterViewModel(provider: MockProvider(expectation: exp))
        
        let filter = CharacterFilterModel(name: "success", status: "status", species: "species", type: "type", gender: "gender")
        vm.filterCharacter(filter: filter)
        
        waitForExpectations(timeout: 0.5)
        XCTAssertTrue(vm.characterList.results?.count != 0)

    }
    func test_filterCharacter_error(){
        let exp = expectation(description: "filterCharacterError")
        let vm = CharacterViewModel(provider: MockProviderError(expectation: exp))
        
        let filter = CharacterFilterModel(name: "error", status: "status", species: "species", type: "type", gender: "gender")
        vm.filterCharacter(filter: filter)
        
        waitForExpectations(timeout: 0.5)
        XCTAssertEqual(vm.errorMessage, "filterCharactersError")

    }
}

