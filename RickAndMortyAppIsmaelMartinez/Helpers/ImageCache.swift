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
    
    func add(image: NSString, id: String) {
        imageCache.setObject(image, forKey: id as NSString)
    }
//
//    func remove(id: NSString) {
//        imageCache.removeObject(forKey: id as NSString)
//    }
    
    func get(id: String) -> NSString? {
        return imageCache.object(forKey: id as NSString)
    }
    
//    func addAllImages(characterList: [CharacterModel], completion: @escaping(_ isLoad: Bool) -> ()){
//
//        DispatchQueue.global().async {
//
//            characterList.forEach{ character in
//
//                do {
//                    let url = URL(string: character.image ?? "")
//                    if let imgUrl = url {
//
//                        self.add(image: "\(imgUrl)" as NSString, id:  "\(character.id ?? 0)")
//
//
////                        let data: Data = try Data(contentsOf: imgUrl)
////
////                        let image = UIImage(data: data)
////                        if let saveImage = image {
////                            self.add(image: saveImage, id: "\(character.id ?? 0)")
////                        }
//
//                    }
//
//                } catch {
//                    print("error cache adding all images")
//                }
//
//            }
//            DispatchQueue.main.async {
//                completion(true)
//            }
//
//        }
//
//
//
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
    
//    static func saveImage(urlString: String, img: UIImage){
//        let path = NSTemporaryDirectory().appending(UUID().uuidString)
//        let url = URL(fileURLWithPath: path)
//
//        let data = img.jpegData(compressionQuality: 0.5)
//        try? data?.write(to: url)
//
//        var dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String:String]
//        if dict != nil {
//            dict = [String:String]()
//        }
//        dict![urlString] = path
//        UserDefaults.standard.set(dict, forKey: "ImageCache")
//
//    }
//
//    static func loadImage(urlString: String, completion: @escaping(String, UIImage?) -> Void) {
//
//        if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String:String] {
//
//            if let path = dict[urlString] {
//                if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
//                    let img = UIImage(data: data)
//                    completion(urlString, img)
//                }
//            }
//        }
//
//        guard let url = URL(string: urlString) else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            guard error == nil else { return }
//            guard let d = data else { return }
//            DispatchQueue.main.async {
//                if let image = UIImage(data: d) {
//                    saveImage(urlString: urlString, img: image)
//                    completion(urlString, image)
//                }
//            }
//        }
//        task.resume()
//    }
    
}
