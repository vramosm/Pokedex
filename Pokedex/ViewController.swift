//
//  ViewController.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    let MAX_ID_POKEMON = 898
    let FIRST_ID_POKEMON = 1
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        index = FIRST_ID_POKEMON
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downloadPokemonInfo()
    }

    @IBAction func doPerformPrev(_ sender: UIButton) {
        if index == FIRST_ID_POKEMON {
            index = MAX_ID_POKEMON
        } else {
            index -= 1
        }
        downloadPokemonInfo()    }
    
    @IBAction func doPerformNext(_ sender: UIButton) {
        if index == MAX_ID_POKEMON {
            index = FIRST_ID_POKEMON
        } else {
            index += 1
        }
        downloadPokemonInfo()
    }
    
    func downloadPokemonInfo() {
        updateView()
        let connection = Connection()
        connection.getPokemon(withId: index) { pokemon in
            if let pokemon = pokemon {
                DispatchQueue.main.async {
                    self.pokemonNameLabel.text = pokemon.name
                }
                
                if let urlImage = pokemon.sprites?.frontDefault {
                    connection.getSprite(withURLString: urlImage) { image in
                        DispatchQueue.main.async {
                            self.pokemonImageView.image = image
                            self.updateView()
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.updateView()
                    }
                }
            }else {
                DispatchQueue.main.async {
                    self.updateView()
                }
            }
        }
    }
    
    func updateView() {
        prevButton.isEnabled.toggle()
        nextButton.isEnabled.toggle()
        prevButton.isEnabled ? myActivityIndicator.stopAnimating() : myActivityIndicator.startAnimating()
        nextButton.isEnabled ? myActivityIndicator.stopAnimating() : myActivityIndicator.startAnimating()
        if (!prevButton.isEnabled ) {
            pokemonNameLabel.text = "Pokemon"
            pokemonImageView.image = UIImage(named: "poke_icon")
        }
        //pokemonImageView.isHidden.toggle()
        //pokemonNameLabel.isHidden.toggle()
    }
}

