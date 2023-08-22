//
//  Provider.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 17/8/23.
//

import Foundation

class ProviderProtocol {
    func getAllCharacters(completion: @escaping (Result<Characters, CustomError>) -> ()) {}
    func filterCharacters(filter: CharacterFilterModel, completion: @escaping(Result<Characters, CustomError>) -> ()) {}
}

class Provider: ProviderProtocol {
    
    let baseUrl: String = "https://rickandmortyapi.com/api"
    
    override func getAllCharacters(completion: @escaping (Result<Characters, CustomError>) -> ()) {
        let page = PageSingleton.instance.page
        
        ImageCache.instance.getAllCharacters(id: 1) { characters in
            
           
            
            let currentPage: Int = {
                
                let nextPage = characters.info?.next?.split(separator: "page=").last?.first?.wholeNumberValue
                let prevPage = characters.info?.prev?.split(separator: "page=").last?.last?.wholeNumberValue
                
                if nextPage != nil {
                    return nextPage! - 1
                } else if prevPage != nil{
                    return prevPage! - 1
                } else {
                    return 1
                }
            }()
            
            if (currentPage == page) && !(characters.results?.isEmpty ?? true) {
                
                completion(.success(characters))
                return
            } else {
                
                var endpoint = "/character"
                
                if page != 0 && page != 1 {
                    endpoint = "\(endpoint)/?page=\(page)"
                }
                
                guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                    completion(.failure(CustomError(errorText: "Ha habido un error inesperado")))
                    return
                }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else {
                        completion(.failure(CustomError(errorText: "Ha habido un error inesperado")))
                        return
                    }
                    
                    let httpResponse = response as? HTTPURLResponse
                    if let code = httpResponse?.statusCode {
                        if (400...500).contains(code) {
                            completion(.failure(CustomError(errorText: "Ha ocurrido un error inesperado")))
                            return
                        } else if (500...600).contains(code) {
                            completion(.failure(CustomError(errorText: "Ha ocurrido un error de red")))
                            return
                        } else {
                            let characterList = try! JSONDecoder().decode(Characters.self, from: data)
                            
                            ImageCache.instance.addAllCharacters(characters: characterList, id: 1)
                            DispatchQueue.main.async {
                                completion(.success(characterList))
                            }
                        }
 
                    }
 
                }.resume()
                
            }
        }

    }
    
    override func filterCharacters(filter: CharacterFilterModel, completion: @escaping(Result<Characters, CustomError>) -> ()) {
        
        
        
        var endpoint: String = "/character/"
        
        if PageSingleton.instance.page != 1 {
            endpoint = "\(endpoint)?page=\(PageSingleton.instance.page)&name=\(filter.name)"
        } else {
            endpoint = "\(endpoint)?name=\(filter.name)"
        }
        
        
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
            completion(.failure(CustomError(errorText: "Ha habido un error inesperado")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(CustomError(errorText: "Ha habido un error inesperado")))
                return
            }
            
            let httpResponse = response as? HTTPURLResponse
            if let code = httpResponse?.statusCode {
                if (400...500).contains(code) {
                    completion(.failure(CustomError(errorText: "Ha ocurrido un error inesperado")))
                    return
                } else if (500...600).contains(code) {
                    completion(.failure(CustomError(errorText: "Ha ocurrido un error de red")))
                    return
                } else {
                    let characterList = try! JSONDecoder().decode(Characters.self, from: data)
                    
                    ImageCache.instance.addAllCharacters(characters: characterList, id: 1)
                    DispatchQueue.main.async {
                        completion(.success(characterList))
                    }
                    
                    
                }
            }
            
            
            
        }.resume()
    }
    
    
    
}
