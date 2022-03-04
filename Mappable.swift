//
//  Mappable.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import Foundation
protocol Mappable: Codable {
    init?(withJSONData: Data?)
}

extension Mappable {
    init?(withJSONData: Data?){
        guard let data = withJSONData else { return nil }
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        }catch {
            return nil
        }
    }
}
