//
//  Provider.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

class Provider {
    
    let baseUrl: String = "https://rickandmortyapi.com/api"
    
    func getAllCharacters(page: Int?, completion: @escaping (_ result: [CharacterModel]) -> ()) {
        
        
        ImageCache.instance.getAllCharacters(id: 1) { characters in
            if !characters.isEmpty {
                completion(characters)
                return
            } else {
                
                var endpoint = "/character"
                
                if let page = page {
                    endpoint = "\(endpoint)/?page=\(page)"
                }
                
                guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                    return
                }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else { return }
                    let characterList = try! JSONDecoder().decode(Characters.self, from: data)
                    
                    if let response = characterList.results {
                        
                        ImageCache.instance.addAllCharacters(characters: response, id: 1)
                        DispatchQueue.main.async {
                            completion(response)
                        }
                        
                    }
                    
                    
                }.resume()
                
            }
        }

    }
    
    func filterCharacters(filter: CharacterFilterModel, completion: @escaping(_ result: [CharacterModel]) -> ()) {
        
        var endpoint: String = "/character/?name=\(filter.name)"
        
        if !(filter.status?.isEmpty ?? true) {
            endpoint = "\(endpoint)&status=\(filter.status ?? "")"
        }
        if !(filter.species?.isEmpty ?? true) {
            endpoint = "\(endpoint)&species=\(filter.species ?? "")"

        }
        if !(filter.type?.isEmpty ?? true) {
            endpoint = "\(endpoint)&type=\(filter.type ?? "")"

        }
        if !(filter.gender?.isEmpty ?? true) {
            endpoint = "\(endpoint)&gender=\(filter.gender ?? "")"

        }
        
        let completeUrl = "\(baseUrl)\(endpoint)".lowercased().replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: completeUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let characterList = try! JSONDecoder().decode(Characters.self, from: data)
            
            
            if let response = characterList.results {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
            
        }.resume()
    }
    
    
    
}
