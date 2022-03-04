//
//  Pokemon.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import Foundation

class Pokemon: Mappable {
    var id: Int?
    var name: String?
    var sprites: Sprite?
    var isDefault: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id
        case name
        case sprites
    }
}
