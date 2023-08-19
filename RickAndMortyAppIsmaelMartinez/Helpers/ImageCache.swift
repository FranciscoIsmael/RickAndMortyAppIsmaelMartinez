//
//  ImageCache.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation
import UIKit

class ImageCache{
    
    static let instance = ImageCache()
    private init(){}
    
    
    var imageCache: NSCache<NSString, NSString> = {
        let cache = NSCache<NSString, NSString>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    var characterCache: NSCache<NSString, CharacterCacheModel> = {
        let cache = NSCache<NSString, CharacterCacheModel>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
//    func add(image: NSString, id: String) {
//        imageCache.setObject(image, forKey: id as NSString)
//    }
//
//    
//    func get(id: String) -> NSString? {
//        return imageCache.object(forKey: id as NSString)
//    }
    

    
    func addAllCharacters(characters: [CharacterModel], id: Int){
        
        var arrayAux = [CharacterModel]()
        characters.forEach{ character in
            do {
                let url = URL(string: character.image ?? "")
                if let imgUrl = url {

                    let data: Data = try Data(contentsOf: imgUrl)
                    
                    arrayAux.append(CharacterModel(id: character.id, name: character.name, status: character.status, type: character.type, gender: character.gender, origin: character.origin, location: character.location, image: character.image, episode: character.episode, url: character.url, created: character.created, uiImage: data))
                }
                
            } catch {
                print("error cache adding all images")
            }
        }
        var characterCacheObject: CharacterCacheModel
        characterCacheObject = CharacterCacheModel(characters: characters, id: id)
//        if arrayAux.isEmpty {
//            characterCacheObject = CharacterCacheModel(characters: characters, id: id)
//
//        } else {
//            characterCacheObject = CharacterCacheModel(characters: arrayAux, id: id)
//        }
       
        
        self.characterCache.setObject(characterCacheObject, forKey: "\(id)" as NSString)
        
    }
    
    func getAllCharacters(id: Int, completion: @escaping([CharacterModel]) -> () ){
        let characterCacheObject =  characterCache.object(forKey: "\(id)" as NSString)
        
        completion(characterCacheObject?.characters ?? [])

    }
    
    
}
