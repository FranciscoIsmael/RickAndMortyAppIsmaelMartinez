//
//  PageSingleton.swift
//  RickAndMortyAppIsmaelMartinez
//
//  Created by Ismael 2 on 21/8/23.
//

import Foundation

class PageSingleton {
    static let instance = PageSingleton()
    private init(){}
    var page = 1
    
    func next(){
        self.page += 1
    }
    func prev(){
        if page > 1 {
            self.page -= 1
        }
    }
}
