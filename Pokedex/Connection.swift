//
//  Connection.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import UIKit

class Connection {
    
    
    let baseURLString = "https://pokeapi.co/api/v2/"
    
    func getPokemon(withId id: Int, completion: @escaping(_ pokemon: Pokemon?) -> Void) {
        guard let url = URL(string: "\(baseURLString)pokemon/\(id)") else {
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                let pokemon = Pokemon(withJSONData: data)
                completion(pokemon)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getSprite(withURLString urlString: String, completion: @escaping(_ image: UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                let image = UIImage(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
