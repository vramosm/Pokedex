//
//  DetailViewController.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    public var pokemon : Pokemon?
    public var pokemonImagen:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Si tenemos pokemon, pinta nombre e imagen
        if let pokemon = pokemon {
            self.label.text = pokemon.name
            
        }
        if let pokemonImage = pokemonImagen {
            imageView.image = pokemonImagen
        }
        
        
        if let isDefault = pokemon?.isDefault {
            self.mySwitch.isOn = isDefault
            if isDefault {
                view.backgroundColor = .gray
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
