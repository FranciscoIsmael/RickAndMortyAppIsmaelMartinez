//
//  ProviderCacheTests.swift
//  RickAndMortyAppIsmaelMartinezTests
//
//  Created by Ismael 2 on 22/8/23.
//

import Foundation
import XCTest

class ProviderCacheTests: XCTestCase {
    func test_providerCache(){
        
        DispatchQueue.main.async {
            PageSingleton.instance.page = 1
            
            let info = PageInfoModel(count: 0, pages: 0, next: "next", prev: "prev")
            let origin = OriginModel(name: "name", url: "url")
            let location = LocationModel(name: "name", url: "url")
            let result = CharacterModel(id: 0, name: "name", status: "status", type: "type", gender: "gender", origin: origin, location: location, image: "image", episode: ["episode1","episode2"], url: "url", created: "created")
            let characters = Characters(info: info, results: [result, result])
            ImageCache.instance.addAllCharacters(characters: characters, id: 1)
            
            let vm = CharacterViewModel(provider: ProviderProtocol())
            
            vm.getAllCharacters()
            
            XCTAssertEqual(vm.characterList.info?.next, info.next)
        }
        
    }
}
