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
        let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
        let characters = Characters(info: info, results: [character,character])
        let characterCache = CharacterCacheModel(characters: characters, id: 1)
        
        XCTAssertEqual(characterCache.id, 1)
        XCTAssertEqual(characterCache.characters, [character, character])
        XCTAssertEqual(characterCache.count, 0)
        XCTAssertEqual(characterCache.pages, 0)
        XCTAssertEqual(characterCache.next, "next")
        XCTAssertEqual(characterCache.prev, "prev")
    }
}

class PageInfoModelTests: XCTestCase {
    func test_init(){
        let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
        XCTAssertEqual(info.count, 0)
        XCTAssertEqual(info.pages, 0)
        XCTAssertEqual(info.next, "next")
        XCTAssertEqual(info.prev , "prev")
    }
}

class CharactersModelTests: XCTestCase{
    func test_Init(){
        let origin = OriginModel(name: "name", url: "url")
        let location = LocationModel(name: "name", url: "url")
        let character = CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: origin, location: location, image: "image", episode: ["episode","episode2"], url: "url", created: "created")
        
        let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
        
        let characters = Characters(info: info, results: [character,character])
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

class PageSingletonTests: XCTestCase {
    func test_init(){
        XCTAssertEqual(PageSingleton.instance.page, 1)
    }
    
   
    func test_prev_notNegative(){
        PageSingleton.instance.page = 1
        PageSingleton.instance.prev()
        XCTAssertEqual(PageSingleton.instance.page, 1)
    }
    func test_prev(){
        PageSingleton.instance.page = 1
        PageSingleton.instance.next()
        PageSingleton.instance.next()
        PageSingleton.instance.prev()
        XCTAssertEqual(PageSingleton.instance.page, 2)
    }
    func test_next(){
        PageSingleton.instance.page = 1
        PageSingleton.instance.next()
        XCTAssertEqual(PageSingleton.instance.page, 2)
    }
}
