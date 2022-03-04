//
//  TableTableViewController.swift
//  Pokedex
//
//  Created by user192546 on 3/4/22.
//

import UIKit

class TableTableViewController: UITableViewController {
    var pokemons: [Pokemon?] = []
    var images: [UIImage?] = []
    let MAX_POKEMONs = 50
    var imagesDownload = 0
    var connection = Connection()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "Pokedex"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pokemons = [Pokemon?](repeating: nil, count: MAX_POKEMONs)
        images = [UIImage?](repeating: nil, count: MAX_POKEMONs)
        
        downloadPokemonsInfo()
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPokemonCell", for: indexPath) as! MyTableViewCell

        
        // Configure the cell...
        if let pokemon = pokemons[indexPath.row] {
            cell.pokemonNameLabel.font = UIFont(name: "Pokemon solid", size: 20)
            cell.pokemonNameLabel.text = pokemon.name ?? "Desconocido"
            
            cell.pokemonNameLabel.textColor = .red
        }
        
        if let image = images[indexPath.row] {
            cell.pokemonImage.image = image
            cell.pokemonActivityIndicator.stopAnimating()
        }
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func downloadPokemonsInfo() {
        for i in 1...MAX_POKEMONs {
            connection.getPokemon(withId: i) { (pokemon) in
                if let pokemon = pokemon, let id = pokemon.id {
                    self.pokemons[id - 1] = pokemon
                    //obtenemos imagen
                    if let image = pokemon.sprites?.frontDefault {
                        self.connection.getSprite(withURLString: image) { image in
                            self.imagesDownload = self.imagesDownload + 1
                            if let image = image {
                                self.images [id-1] = image
                                }
                            if self.imagesDownload == self.MAX_POKEMONs {
                                DispatchQueue.main.async {
                                    //Una vez descargada las imagenes se lanza el refresco de la tabla
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailSegue" {
            if let detailVC = segue.destination as? DetailViewController,
               let indexPath = tableView.indexPathForSelectedRow,
               let pokemon = pokemons[indexPath.row],
               let imagen = images[indexPath.row] {
                //Pasamos los datos del pokemon
                detailVC.pokemonImagen = imagen
                detailVC.pokemon = pokemon
            }
        }
        
    }
}
