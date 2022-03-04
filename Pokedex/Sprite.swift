//
//  Sprite.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import Foundation

class Sprite: Mappable {
    var frontDefault: String?
    var backDefault: String?
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        
    }
}
