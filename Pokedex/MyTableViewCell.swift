//
//  MyTableViewCell.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!

    @IBOutlet weak var pokemonActivityIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
