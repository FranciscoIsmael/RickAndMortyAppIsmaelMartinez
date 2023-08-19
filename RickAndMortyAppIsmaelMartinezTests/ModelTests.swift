//
//  ModelTests.swift
//  RickAndMortyAppIsmaelMartinezTests
//
//  Created by Ismael 2 on 19/8/23.
//

import Foundation
import XCTest

class CharacterCacheModelTests: XCTestCase {
    func test_init(){
        let origin = OriginModel(name: "name", url: "url")
        let location = LocationModel(name: "name", url: "url")
        let character = CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: origin, location: location, image: "image", episode: ["episode","episode2"], url: "url", created: "created")
        let characterCache = CharacterCacheModel(characters: [character, character], id: 1)
        
        XCTAssertEqual(characterCache.id, 1)
        XCTAssertEqual(characterCache.characters, [character, character])
    }
}

class CharactersModelTests: XCTestCase{
    func test_Init(){
        let origin = OriginModel(name: "name", url: "url")
        let location = LocationModel(name: "name", url: "url")
        let character = CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: origin, location: location, image: "image", episode: ["episode","episode2"], url: "url", created: "created")
       let characters = Characters(results: [character,character])
        XCTAssertTrue(characters.results?.count != 0)
        
    }
}

class CharacterModelTests: XCTestCase {
    func test_init(){
        let origin = OriginModel(name: "name", url: "url")
        let location = LocationModel(name: "name", url: "url")
        let character = CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: origin, location: location, image: "image", episode: ["episode","episode2"], url: "url", created: "created")
        XCTAssertEqual(character.id, 0)
        XCTAssertEqual(character.name, "name")
        XCTAssertEqual(character.status, "status")
        XCTAssertEqual(character.type, "type")
        XCTAssertEqual(character.gender, "gender")
        XCTAssertEqual(character.origin, OriginModel(name: "name", url: "url"))
        XCTAssertEqual(character.location, LocationModel(name: "name", url: "url"))
        XCTAssertEqual(character.image, "image")
        XCTAssertEqual(character.episode, ["episode","episode2"])
        XCTAssertEqual(character.url, "url")
        XCTAssertEqual(character.created, "created")

    }
}

class OriginModelTests: XCTestCase {
    func test_init(){
        let origin = OriginModel(name: "name", url: "url")
        XCTAssertEqual(origin.name, "name")
        XCTAssertEqual(origin.url, "url")
    }
}

class LocationModelTests: XCTestCase {
    func test_init(){
        let location = LocationModel(name: "name", url: "url")
        XCTAssertEqual(location.name, "name")
        XCTAssertEqual(location.url, "url")
    }
}

class CustomErroModelTests: XCTestCase {
    func test_init(){
        let cError = CustomError(errorText: "error")
        XCTAssertEqual(cError.errorText, "error")
    }
}
