//
//  PokeAPIViewController.swift
//  app2
//
//  Created by Universidad Anahac on 31/08/22.
//

import UIKit

class PokeAPIViewController: UIViewController {

    
    struct PokemonList: Decodable {
        var count: Int
        var next: String?
        var previous: String?
        var results: [Pokemon]
    }

    struct Pokemon: Decodable {
        var name: String
        var url: String
    }
    
    
    
    @IBOutlet weak var loading_icon: UIActivityIndicatorView!
    @IBOutlet weak var table_view: UITableView!
    var pokemons: [Pokemon] = []
    var current_pokemon: Pokemon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_view.dataSource = self
        table_view.delegate = self
        loading_icon.hidesWhenStopped = true
        loading_icon.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
            self.loadPokemons()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokeInfo"{
            let info = segue.destination as? PokemonInfoViewController
            info?.url = (current_pokemon?.url)!
        }
    }
    
    func loadPokemons(){
        let urlBase = "https://pokeapi.co/api/v2/"
        let listPokemonEndPoint = URL.init(string: "\(urlBase)pokemon?limit=100000&offset=0")!
        let task = URLSession.shared.dataTask(with: listPokemonEndPoint){data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let result = try! jsonDecoder.decode(PokemonList.self, from: data)
                self.pokemons = result.results
                DispatchQueue.main.sync {
                    self.loading_icon.stopAnimating()
                    self.table_view.reloadData()
                }
                
            }
        }
        task.resume()
    }

}

extension PokeAPIViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table_view.dequeueReusableCell(withIdentifier: "cell")
        if(cell == nil){
            cell = UITableViewCell()
        }
        let item = pokemons[indexPath.row]
        cell?.textLabel?.text = item.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        current_pokemon = pokemons[indexPath.row]
        print(current_pokemon?.name)
        performSegue(withIdentifier: "toPokeInfo", sender: nil)
    }

}
